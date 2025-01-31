# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchzip, fetchFromGitHub, dockerTools }:
{
  cakeml = {
    pname = "cakeml";
    version = "v2274";
    src = fetchzip {
      url = "https://github.com/CakeML/cakeml/releases/download/v2274/cake-x64-64.tar.gz";
      sha256 = "sha256-etPOxeW9jY3kltsqoj8jthmggDt8eQdmJcF0p3YDACs=";
    };
  };
  enso = {
    pname = "enso";
    version = "2024.1.1";
    src = fetchurl {
      url = "https://github.com/enso-org/enso/releases/download/2024.1.1/enso-linux-x86_64-2024.1.1.AppImage";
      sha256 = "sha256-GW5XEPFZ5f+dXsumRpSp/bLiE/zfWq08+CkQ2dC7QZk=";
    };
  };
  guile-config = {
    pname = "guile-config";
    version = "0.5.0";
    src = fetchzip {
      url = "https://gitlab.com/a-sassmannshausen/guile-config/-/archive/0.5.0/guile-config-0.5.0.tar.gz";
      sha256 = "sha256-8Ma2pzqR8il+8H6WVbYLpKBk2rh3aKBr1mvvzdpCNPc=";
    };
  };
  guile-hall = {
    pname = "guile-hall";
    version = "0.4.1";
    src = fetchzip {
      url = "https://gitlab.com/a-sassmannshausen/guile-hall/-/archive/0.4.1/guile-hall-0.4.1.tar.gz";
      sha256 = "sha256-TUCN8kW44X6iGbSJURurcz/Tc2eCH1xgmXH1sMOMOXs=";
    };
  };
  seamonkey = {
    pname = "seamonkey";
    version = "2.53.18.2";
    src = fetchzip {
      url = "https://archive.seamonkey-project.org/releases/2.53.18.2/linux-x86_64/en-US/seamonkey-2.53.18.2.en-US.linux-x86_64.tar.bz2";
      sha256 = "sha256-sgkEhgyWMisyrK/ZxlgbpMKZV9/AdbcyjbsjYZhY0k0=";
    };
  };
  trufflesqueak = {
    pname = "trufflesqueak";
    version = "23.1.0";
    src = fetchurl {
      url = "https://github.com/hpi-swa/trufflesqueak/releases/download/23.1.0/trufflesqueak-23.1.0-linux-amd64.tar.gz";
      sha256 = "sha256-wdFfNHgcRYKMOVbfjo2j8IRu5+izMNQK1tUXX1vFwtA=";
    };
  };
  trufflesqueak-image = {
    pname = "trufflesqueak-image";
    version = "23.1.0";
    src = fetchurl {
      url = "https://github.com/hpi-swa/trufflesqueak/releases/download/23.1.0/TruffleSqueakImage-23.1.0.zip";
      sha256 = "sha256-/9rbH9hEHSgaOUbSHpDCdmCX4m+myxVIgG6Nf5r85Zg=";
    };
  };
  wasmfxtime = {
    pname = "wasmfxtime";
    version = "1d74eb0683a4cbd8cfdb6c2c78a005fc1a2e65b6";
    src = fetchFromGitHub {
      owner = "wasmfx";
      repo = "wasmfxtime";
      rev = "1d74eb0683a4cbd8cfdb6c2c78a005fc1a2e65b6";
      fetchSubmodules = true;
      sha256 = "sha256-v3gtJRPDrzQzdq9C3+RwMlRi1GOCzNACxPPBknyMjX8=";
    };
    cargoLock."./Cargo.lock" = {
      lockFile = ./wasmfxtime-1d74eb0683a4cbd8cfdb6c2c78a005fc1a2e65b6/./Cargo.lock;
      outputHashes = {
        "wasm-encoder-0.209.0" = "sha256-6rtIhiADuBJTvInsP8gTEyyepEd+h6beSDpzUbOGE8A=";
        "wasm-encoder-0.209.1" = "sha256-RR+F6RIexUAS3MajvV8fL4sfkNFKQt6pNvLwMvNKv7w=";
        "wit-bindgen-0.26.0" = "sha256-+KjFdilYKSCR285M4Fai8ocCDrkerIb9EKTKRTz+aEg=";
      };
    };
    date = "2024-06-14";
  };
}
