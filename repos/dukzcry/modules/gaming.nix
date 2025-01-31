{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.gaming;
in {
  options.programs.gaming = {
    enable = mkEnableOption "gaming support";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lutris steamPackages.steam-fhsenv-without-steam.run
    ];
    programs.gamescope.enable = true;
    # https://github.com/NixOS/nixpkgs/issues/292620
    programs.gamescope.capSysNice = false;
  };
}
