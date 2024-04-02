# administer with pw-cli, pw-mon, pw-top commands
#
# performance tuning: <https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Performance-tuning>
{ config, lib, pkgs, ... }:
let
  cfg = config.sane.programs.pipewire;
in
{
  sane.programs.pipewire = {
    suggestedPrograms = [ "wireplumber" ];

    # sandbox.method = "landlock";  #< also works
    sandbox.method = "bwrap";
    sandbox.whitelistDbus = [
      # dbus is used for rtkit integration
      # rtkit runs on the system bus.
      # xdg-desktop-portal then exposes this to the user bus.
      # therefore, user bus should be all that's needed, but...
      # xdg-desktop-portal-wlr depends on pipewire, hence pipewire has to start before xdg-desktop-portal.
      # then, pipewire has to talk specifically to rtkit (system) and not go through xdp.
      # "user"
      "system"
    ];
    sandbox.wrapperType = "inplace";  #< its config files refer to its binaries by full path
    sandbox.extraConfig = [
      "--sane-sandbox-keep-namespace" "pid"
    ];
    sandbox.usePortal = false;
    # needs to *create* the various device files, so needs write access to the /run/user/$uid directory itself
    sandbox.extraRuntimePaths = [ "/" ];
    sandbox.extraPaths = [
      "/dev/snd"
      # desko/lappy don't need these, but moby complains if not present
      "/dev/video0"
      "/dev/video1"
      "/dev/video2"
    ];
    sandbox.extraHomePaths = [
      # pulseaudio cookie
      ".config/pulse"
    ];

    # see: <https://docs.pipewire.org/page_module_protocol_native.html>
    # defaults to placing the socket in /run/user/$id/{pipewire-0,pipewire-0-manager,...}
    # but that's trickier to sandbox
    env.PIPEWIRE_RUNTIME_DIR = "$XDG_RUNTIME_DIR/pipewire";

    services.pipewire = {
      description = "pipewire: multimedia service";
      partOf = [ "sound" ];
      # depends = [ "xdg-desktop-portal" ];  # for Realtime portal (dependency cycle)
      # env PIPEWIRE_LOG_SYSTEMD=false"
      # env PIPEWIRE_DEBUG"*:3,mod.raop*:5,pw.rtsp-client*:5"
      command = pkgs.writeShellScript "pipewire-start" ''
        mkdir -p $PIPEWIRE_RUNTIME_DIR
        exec pipewire
      '';
      readiness.waitExists = [
        "$PIPEWIRE_RUNTIME_DIR/pipewire-0"
        "$PIPEWIRE_RUNTIME_DIR/pipewire-0-manager"
      ];
      cleanupCommand = ''rm -f "$PIPEWIRE_RUNTIME_DIR/{pipewire-0,pipewire-0.lock,pipewire-0-manager,pipewire-0-manager.lock}"'';
    };
    services.pipewire-pulse = {
      description = "pipewire-pulse: Pipewire compatibility layer for PulseAudio clients";
      depends = [ "pipewire" ];
      partOf = [ "sound" ];
      command = "pipewire-pulse";
      readiness.waitExists = [
        "$XDG_RUNTIME_DIR/pulse/native"
        "$XDG_RUNTIME_DIR/pulse/pid"
      ];
      cleanupCommand = ''rm -f "$XDG_RUNTIME_DIR/pulse/{native,pid}"'';
    };
  };

  # taken from nixos/modules/services/desktops/pipewire/pipewire.nix
  # removed 32-bit compatibility stuff
  environment.etc = lib.mkIf cfg.enabled {
    "alsa/conf.d/49-pipewire-modules.conf".text = ''
      pcm_type.pipewire {
        libs.native = ${cfg.package}/lib/alsa-lib/libasound_module_pcm_pipewire.so ;
      }
      ctl_type.pipewire {
        libs.native = ${cfg.package}/lib/alsa-lib/libasound_module_ctl_pipewire.so ;
      }
    '';

    "alsa/conf.d/50-pipewire.conf".source = "${cfg.package}/share/alsa/alsa.conf.d/50-pipewire.conf";
    "alsa/conf.d/99-pipewire-default.conf".source = "${cfg.package}/share/alsa/alsa.conf.d/99-pipewire-default.conf";
  };

  services.udev.packages = lib.mkIf cfg.enabled [
    cfg.package
  ];

  # rtkit/RealtimeKit: allow applications which want realtime audio (e.g. Dino? Pulseaudio server?) to request it.
  # this might require more configuration (e.g. polkit-related) to work exactly as desired.
  # - readme outlines requirements: <https://github.com/heftig/rtkit>
  # XXX(2023/10/12): rtkit does not play well on moby. any application sending audio out dies after 10s.
  # - note that `rtkit-daemon` can be launched with a lot of config: pipewire docs (top of this file)
  #   suggest using a much less aggressive canary. maybe try that?
  security.rtkit.enable = lib.mkIf cfg.enabled true;
}
