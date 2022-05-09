{
  description = "wolfangaukang's flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nixgl.url = "github:guibou/nixGL";
    sab.url = "git+https://codeberg.org/wolfangaukang/stream-alert-bot?ref=main";
  };

  outputs = { self, nur, home-manager, nixpkgs, nixos-hardware, nixgl, sab, ... }@inputs:
    let
      inherit (home-manager.lib) homeManagerConfiguration;
      inherit (nixpkgs.lib) genAttrs nixosSystem;

      importAttrset = path: builtins.mapAttrs (_: import) (import path);
      forAllSystems = f: genAttrs pkgs_systems (system: f system);

      # Local NUR related
      pkgs_systems = [
        "x86_64-linux"
      ];

      # System build related
      sab_overlay = final: prev: { stream-alert-bot = sab.packages.${prev.system}.default; };
      overlays = [
        nixgl.overlay
        nur.overlay
        sab_overlay
      ];
      username = "bjorn";
      system = "x86_64-linux";

    in {
      # Module setup
      nixosModules = importAttrset ./modules/nixos;
      hmModules = importAttrset ./modules/home-manager;

      # Host setup
      homeManagerConfigurations = {
        pop = homeManagerConfiguration ( import ./hosts/pop/hm-config.nix { inherit username system overlays; } inputs );
        wsl = homeManagerConfiguration ( import ./hosts/wsl/hm-config.nix { inherit username system overlays; } inputs );
      };
      nixosConfigurations = {
        eyjafjallajokull = nixosSystem ( import ./hosts/eyjafjallajokull/nixos-system.nix { inherit username system overlays; } inputs );
        holuhraun = nixosSystem ( import ./hosts/holuhraun/nixos-system.nix { inherit username system overlays; } inputs );
      };

      # Easy setup for testing
      pop = self.homeManagerConfigurations.pop.activationPackage;
      wsl = self.homeManagerConfigurations.wsl.activationPackage;
      eyjafjallajokull = self.nixosConfigurations.eyjafjallajokull.config.system.build.toplevel;
      holuhraun = self.nixosConfigurations.holuhraun.config.system.build.toplevel;

      # General settings
      packages = forAllSystems (system: import ./pkgs {
        pkgs = import nixpkgs { inherit system; };
      });

      templates = import ./templates;
    };
}
