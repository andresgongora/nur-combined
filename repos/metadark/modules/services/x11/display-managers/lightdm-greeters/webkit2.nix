{ config, lib, pkgs, ... }:

with lib;
let
  nur = import ../../../../.. { inherit pkgs; };
  dmcfg = config.services.xserver.displayManager;
  ldmcfg = dmcfg.lightdm;
  cfg = ldmcfg.greeters.webkit2;

  webkit2GreeterConf = pkgs.writeText "lightdm-webkit2-greeter.conf" ''
    [greeter]
    debug_mode = ${if cfg.debugMode then "true" else "false"}
    detect_theme_errors = ${if cfg.detectThemeErrors then "true" else "false"}
    screensaver_timeout = ${toString cfg.screensaverTimeout}
    secure_mode = ${if cfg.secureMode then "true" else "false"}
    time_format = ${cfg.time.format}
    time_language = ${cfg.time.language}
    webkit_theme = ${cfg.webkitTheme}

    [branding]
    background_images = ${cfg.branding.backgroundImages}
    logo = ${cfg.branding.logo}
    user_image = ${cfg.branding.userImage}
  '';
in
{
  options = {
    services.xserver.displayManager.lightdm.greeters.webkit2 = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to enable lightdm-webkit2-greeter as the lightdm greeter.
        '';
      };

      debugMode = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Show a context menu on right click, which provides access to developer tools.
        '';
      };

      detectThemeErrors = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Provide an option to load a fallback theme when theme errors are detected.
        '';
      };

      screensaverTimeout = mkOption {
        type = types.int;
        default = 300;
        description = ''
          Blank the screen after this many seconds of inactivity.
          This only takes effect if launched as a lock-screen (eg. dm-tool lock).
        '';
      };

      secureMode = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Don't allow themes to make remote http requests.
        '';
      };

      time = {
        format = mkOption {
          type = types.str;
          default = "LT";
          description = ''
            A moment.js format string so the greeter can generate localized time for display.

            See http://momentjs.com/docs/#/displaying/format/ for available options.
          '';
        };

        language = mkOption {
          type = types.str;
          default = "auto";
          description = ''
            Language to use when displaying the time or "auto" to use the system's language.
          '';
        };
      };

      webkitTheme = mkOption {
        type = types.either types.path (types.enum [ "antergos" "simple" ]);
        default = "antergos";
        example = ''
          fetchzip {
            url = "https://github.com/Litarvan/lightdm-webkit-theme-litarvan/releases/download/v3.0.0/lightdm-webkit-theme-litarvan-3.0.0.tar.gz";
            hash = "sha256:0q0r040vxg1nl51wb3z3r0pl7ymhyhp1lbn2ggg7v3pa563m4rrv";
          };
        '';
        description = ''
          Path to webkit theme or name of a builtin theme.
        '';
      };

      branding = {
        backgroundImages = mkOption {
          type = types.path;
          default = dirOf ldmcfg.background;
          example = "\${pkgs.gnome3.gnome-backgrounds}/share/backgrounds/gnome";
          description = ''
            Path to directory that contains background images for use by themes.
          '';
        };

        logo = mkOption {
          type = types.path;
          default = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/4f041870efa1a6f0799ef4b32bb7be2cafee7a74/logo/nixos.svg";
            hash = "sha256:0b0dj408c1wxmzy6k0pjwc4bzwq286f1334s3cqqwdwjshxskshk";
          };
          description = ''
            Path to logo image for use by greeter themes.
          '';
        };

        userImage = mkOption {
          type = types.path;
          default = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          description = ''
            Default user image/avatar. This is used by themes for users that have no .face image.
          '';
        };
      };
    };
  };

  config = mkIf (ldmcfg.enable && cfg.enable) {
    # Install package, for manpages and the ability to run the greeter while logged in
    environment.systemPackages = [ nur.lightdm-webkit2-greeter ];

    services = {
      xserver.displayManager.lightdm = {
        greeters.gtk.enable = false;
        greeter = mkDefault {
          package = nur.lightdm-webkit2-greeter.xgreeters;
          name = "lightdm-webkit2-greeter";
        };
      };

      # Use Assistive Technologies service
      gnome3.at-spi2-core.enable = true;
    };

    environment.etc."lightdm/lightdm-webkit2-greeter.conf".source = webkit2GreeterConf;
  };
}
