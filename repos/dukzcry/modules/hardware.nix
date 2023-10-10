imports: { config, lib, pkgs, ... }:

with lib;
let
  cfg = config.services.hardware;
  any' = l: any (x: x == config.networking.hostName) l;
  laptop = any' [ "suitecase" ];
  server = any' [ "robocat" ];
  desktop = any' [ "powerhorse" ];
  ip4 = pkgs.nur.repos.dukzcry.lib.ip4;
  builder = {
    nix.buildMachines = [{
      hostName = "powerhorse";
      systems = [ "x86_64-linux" "i686-linux" ];
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      maxJobs = 4;
    }];
    nix.extraOptions = ''
      builders-use-substitutes = true
    '';
    nix.distributedBuilds = true;
    nix.settings.substituters = [ "http://powerhorse:5000" ];
    nix.settings.trusted-public-keys = [ "powerhorse-1:d6cps6qy6UuAaTquP0RwSePLhrmzz9xFjk+rVlmP2sY=" ];
  };
in {
  inherit imports;

  options.services.hardware = {
    enable = mkEnableOption ''
      Hardware tweaks for different hosts
    '';
    user = mkOption {
      type = types.str;
    };
    remminaLegacy = mkEnableOption ''
      Make Remmina work on legacy hardware
    '';
  };

  config = mkMerge [
    (mkIf cfg.enable {
      services.fstrim.enable = true;
      boot.kernel.sysctl."vm.swappiness" = 1;
      boot.loader.systemd-boot.enable = true;
      location.latitude = 55.751244;
      location.longitude = 37.618423;
    })
    (mkIf (cfg.enable && server) ({
      systemd.watchdog.runtimeTime = "30s";
      systemd.watchdog.rebootTime = "10m";
      systemd.watchdog.kexecTime = "10m";
      powerManagement.cpuFreqGovernor = lib.mkDefault "schedutil";
    } // builder))
    (mkIf (cfg.enable && laptop) ({
      hardware.bluetooth.enable = true;
      services.upower = {
        enable = true;
        percentageLow = 7;
        percentageCritical = 6;
        percentageAction = 5;
        criticalPowerAction = "Hibernate";
      };
      programs.light.enable = true;
      users.users.${cfg.user}.extraGroups = [ "video" ];
      boot.kernelParams = [ "mitigations=off" ];
      services.tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "powersave";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        };
      };
      hardware.opengl.extraPackages = [ pkgs.vaapiIntel ];
      services.picom = {
        enable = true;
        vSync = true;
        backend = "glx";
      };
      services.xserver.displayManager.sessionCommands = ''
        printf "%s\n" "Xft.dpi: 120" | xrdb -merge
      '';
      services.redshift.enable = true;
      services.logind.extraConfig = ''
        HandlePowerKey=hibernate
      '';
      services.hardware.remminaLegacy = true;
    } // builder))
    (mkIf (cfg.enable && desktop) {
      services.nix-serve = {
        enable = true;
        secretKeyFile = "/var/cache-priv-key.pem";
      };
      nix.settings.cores = 8;
      boot.loader.systemd-boot.configurationLimit = 70;
      hardware.bluetooth.enable = true;
      powerManagement.cpuFreqGovernor = lib.mkDefault "schedutil";
      services.xserver.displayManager.sessionCommands = ''
        printf "%s\n" "Xft.dpi: 144" | xrdb -merge
      '';
      services.redshift.enable = true;
      services.logind.extraConfig = ''
        HandlePowerKey=suspend
      '';
    })
  ];
}
