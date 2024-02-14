imports: { config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.theme;
in {
  inherit imports;

  options.programs.theme = {
    enable = mkEnableOption "theming.";
    dark = mkEnableOption "dark theme.";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      theme.name = "Adwaita${optionalString cfg.dark "-dark"}";
      gtk3noCsd = true;
    };
    qt = {
      enable = true;
      platformTheme = "qt5ct";
    };
    environment.systemPackages = with pkgs; [ adwaita-qt adwaita-qt6 ];
  };
}
