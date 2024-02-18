{ pkgs ? import <nixpkgs> { } }:
let
  # ugly redefine
  genFilteredDirAttrsV2 = dir: excludes:
    with pkgs.lib; genAttrs
      (with builtins; filter
        (n: !elem n excludes)
        (map (removeSuffix ".nix")
          (attrNames
            (readDir dir))));

  shadowedPkgs = [
    "tcp-brutal"
    "shufflecake"

    # use things from flake that  not pass strict eval
    "opulr-a-run"
    "restls"
    "shadow-tls"
  ];
in
(genFilteredDirAttrsV2 ./pkgs shadowedPkgs
  (name: pkgs.callPackage (./pkgs + "/${name}.nix") { }))
