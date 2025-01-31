{ config, lib, pkgs, ... }:
let
  cfg = config.sane.programs.waybar;
  mkEnableOption' = default: description: lib.mkOption {
    type = lib.types.bool;
    inherit default description;
  };
in
{
  sane.programs.waybar = {
    configOption = with lib; mkOption {
      type = types.submodule {
        options = {
          extraStyle = mkOption {
            type = types.lines;
            default = "";
            description = ''
              extra CSS rules to append to ~/.config/waybar/style.css
            '';
          };
          fontSize = mkOption {
            type = types.int;
            default = 16;
            description = ''
              default font-size is about 14px, which is good for moby, but not quite for larger displays
            '';
          };
          height = mkOption {
            type = types.int;
            default = 40;
            description = ''
              height of the top bar in px.
            '';
          };
          persistWorkspaces = mkOption {
            type = types.listOf types.str;
            default = [];
            description = ''
              list of workspaces to always show, e.g. [ "1" "7" ]
            '';
          };

          modules.windowTitle = mkEnableOption' true "display window title in center";
          modules.media = mkEnableOption' true "display current track on right";
          modules.perf = mkEnableOption' true "display RAM, CPU on right";
          modules.network = mkEnableOption' true "display IP traffic on right";

          top = mkOption {
            type = types.submodule {
              # `attrsOf types.anything` (v.s. plain `attrs`) causes merging of the toplevel items.
              # this allows for `waybar.top.x = lib.mkDefault a;` with `waybar.top.x = b;` to resolve to `b`.
              # but note that `waybar.top.x.y = <multiple assignment>` won't be handled as desired.
              freeformType = types.attrsOf types.anything;
            };
            default = {};
            description = ''
              Waybar configuration for the bar at the top of the display.
              see: <https://github.com/Alexays/Waybar/wiki/Configuration>
              example:
              ```nix
              {
                height = 40;
                modules-left = [ "sway/workspaces" "sway/mode" ];
                ...
              }
              ```
            '';
          };
        };
      };
    };

    # default waybar
    config.top = pkgs.callPackage ./waybar-top.nix { } {
      inherit (cfg.config) height modules persistWorkspaces;
    };

    packageUnwrapped = pkgs.waybar.override {
      # not *required*, however this does cut down on some cross-compilation issues
      # and also avoids building entirely unused dependencies
      sway = config.sane.programs.sway.package.sway-unwrapped;
      # hyprlandSupport = false;  #< doesn't cross
    };

    sandbox.method = "bwrap";
    sandbox.net = "all";  #< to show net connection status and BW
    sandbox.whitelistDbus = [
      "user"  #< for playerctl/media
      "system"  #< for modem (on phone)
    ];
    sandbox.whitelistWayland = true;
    sandbox.extraRuntimePaths = [
      "sway"
      # "sxmo_status"  #< only necessary if relying on sxmo's statusbar periodicals service
    ];
    sandbox.extraPaths = [
      # for wifi status on sxmo/phone
      "/dev/rfkill"
      # for the battery indicator
      "/sys/class/power_supply"
      "/sys/devices"
    ];
    sandbox.extraHomePaths = [
      ".config/sxmo/hooks"
    ];

    fs.".config/waybar/config".symlink.target =
      (pkgs.formats.json {}).generate "waybar-config.json" [
        ({ layer = "top"; } // cfg.config.top)
      ];
    fs.".config/waybar/style.css".symlink.target = pkgs.substituteAll {
      src = ./waybar-style.css;
      inherit (cfg.config) extraStyle fontSize;
    };

    services.waybar = {
      description = "swaybar graphical header bar/tray for sway";
      partOf = [ "graphical-session" ];

      # env G_MESSAGES_DEBUG=all
      command = "waybar";
    };
  };
}
