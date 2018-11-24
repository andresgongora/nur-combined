{ callPackage, lib }:

with lib;

let

  mkModules = list:
    let
      nameFromPath = path:
        replaceStrings [ ".nix" ] [ "" ] (last (splitString "/" (toString path)));
    in
      (listToAttrs
        (map (path: { name = "${nameFromPath path}"; value = import path; }) list));

  containerLib = callPackage ./lib/containers { };

in

rec {

  modules = mkModules [
    ./modules/hydra.nix
    ./modules/sieve-dsl.nix
  ];

  ### OVERLAYS
  overlays = {
    sudo    = import ./pkgs/sudo/overlay.nix;
    termite = import ./pkgs/termite/overlay.nix;
    hydra   = import ./pkgs/hydra/overlay.nix;
    php     = import ./pkgs/php/overlay.nix;
  };

  ### PACKAGES
  gianas-return = callPackage ./pkgs/gianas-return { };

  ### LIBRARY
  mkTexDerivation = callPackage ./lib/tex/make-tex-env.nix { };

  checkoutNixpkgs = callPackage ./lib/release/checkout-nixpkgs.nix { };

  mkJob = callPackage ./lib/release/mk-job.nix { };

  mkTests = callPackage ./tests/mk-test.nix { };

  callNURPackage = callPackage;

  inherit (containerLib) node2container containers gen-firewall;

}
