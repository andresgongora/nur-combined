{ pkgs ? import <nixpkgs> { } }:

rec {
  lib = import ./lib { inherit pkgs; };
  modules = import ./modules;
  overlays = import ./overlays;

  cups-detonger = pkgs.callPackage ./pkgs/cups-detonger { };
  safeheron-crypto-suites = pkgs.callPackage ./pkgs/safeheron-crypto-suites { };
  multi-party-sig = pkgs.callPackage ./pkgs/multi-party-sig { safeheron-crypto-suites = safeheron-crypto-suites; };
}
