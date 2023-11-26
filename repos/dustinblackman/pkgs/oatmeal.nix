# DO NOT EDIT. This file was auto generated by ../scripts/generate-pkg.sh
{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "oatmeal";
  src = pkgs.fetchurl {
    url = "https://github.com/dustinblackman/oatmeal/releases/download/v0.5.2/oatmeal_0.5.2_linux_amd64.tar.gz";
    sha256 = "0x609dkg2rqsldw50ga1fjbsxjj4g9hraz51iky6z37ab348wnjg";
  };
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    tar -zxf $src -C $out/bin/ oatmeal
  '';
}

