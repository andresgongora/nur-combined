# Full desktop
{ pkgs, ... }:
{
  imports = [
    ./desktop.nix
    ../hardware/halo65.nix
  ];

  abszero = {
    virtualisation = {
      act.enable = true;
      libvirtd.enable = true;
    };
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      kanata.enable = true;
      rclone = {
        enable = true;
        enableFileSystems = true;
      };
    };
    programs = {
      neovim.enable = true;
      pot.enable = true;
      steam.enable = true;
      wireshark.enable = true;
    };
    i18n.inputMethod.fcitx5.enable = true;
  };

  boot.plymouth.enable = true;

  virtualisation.waydroid.enable = true;

  services = {
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true; # For storing vscode auth token
    mpd.enable = true;
  };

  programs = {
    dconf.enable = true;
    fish.enable = true; # For vendor completions; config is managed by home-manager
    kdeconnect.enable = true;
    nix-ld.enable = true;
    ssh = {
      enableAskPassword = true;
      askPassword = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
    };
  };

  environment = {
    defaultPackages = [ ];
    systemPackages = with pkgs; [
      # TODO: Switch to anki-qt6 when it is no longer broken on Wayland
      anki-bin-qt6
      aseprite
      ffmpeg_5-full
      gh
      git-absorb
      git-secret
      gnome-solanum
      goldendict-ng
      inkscape
      jetbrains.idea-community
      jq
      katawa-shoujo-re-engineered
      kooha
      libreoffice-qt
      neofetch
      obsidian-ime
      protonmail-bridge
      protonvpn-gui
      taisei
      tenacity
      unzip
      (ventoy.override {
        defaultGuiType = "qt5";
        withQt5 = true;
      })
      vesktop
      vscode
      wget
      win2xcur
      xorg.xeyes
      zip
    ];
  };
}
