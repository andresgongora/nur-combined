# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  copyq-darwin = {
    pname = "copyq-darwin";
    version = "7.1.0";
    src = fetchurl {
      url = "https://github.com/hluk/CopyQ/releases/download/v7.1.0/CopyQ.dmg.zip";
      sha256 = "sha256-8dYfEZSSI5NHGXXA+KzPg61Y7Z6nezo0Knced3j3TRU=";
    };
  };
  emacs-plus = {
    pname = "emacs-plus";
    version = "d565d8ada1c2e00c3182b57ea6bc6497ebb7bdef";
    src = fetchFromGitHub {
      owner = "d12frosted";
      repo = "homebrew-emacs-plus";
      rev = "d565d8ada1c2e00c3182b57ea6bc6497ebb7bdef";
      fetchSubmodules = false;
      sha256 = "sha256-RLbkHfnnXIJjaYLhfHleSztfPmcms5k0gy3slrYp20Y=";
    };
    date = "2024-03-12";
  };
  nixfmt = {
    pname = "nixfmt";
    version = "2b5ee820690bae64cb4003e46917ae43541e3e0b";
    src = fetchFromGitHub {
      owner = "piegamesde";
      repo = "nixfmt";
      rev = "2b5ee820690bae64cb4003e46917ae43541e3e0b";
      fetchSubmodules = false;
      sha256 = "sha256-D8OYHmW3BiOfv7HSjBqihfqBihraeE7jdac9ggNbMsQ=";
    };
    date = "2024-03-01";
  };
  nixpkgs-review = {
    pname = "nixpkgs-review";
    version = "8e8f6f97a8259728f7bdbe8ca0aaec87d5f33cc9";
    src = fetchFromGitHub {
      owner = "natsukium";
      repo = "nixpkgs-review";
      rev = "8e8f6f97a8259728f7bdbe8ca0aaec87d5f33cc9";
      fetchSubmodules = false;
      sha256 = "sha256-E8dtlnor79fKVGAGxwibntfSPCcjCmpAYLO+Dxku69k=";
    };
    date = "2024-02-20";
  };
  nowplaying-cli = {
    pname = "nowplaying-cli";
    version = "1.2.1";
    src = fetchurl {
      url = "https://github.com/kirtan-shah/nowplaying-cli/archive/v1.2.1.tar.gz";
      sha256 = "sha256-u0kSPGYoK2SVwkVYkxOvyUh1p7DoLJrp951vJedQPbQ=";
    };
  };
  qmk-toolbox = {
    pname = "qmk-toolbox";
    version = "0.3.1";
    src = fetchurl {
      url = "https://github.com/qmk/qmk_toolbox/releases/download/0.3.1/QMK.Toolbox.app.zip";
      sha256 = "sha256-J3yh/VsTSAyU688/GToOI4hOkRFdozxTVvp9Yp/bIlg=";
    };
  };
  qutebrowser-darwin = {
    pname = "qutebrowser-darwin";
    version = "3.1.0";
    src = fetchurl {
      url = "https://github.com/qutebrowser/qutebrowser/releases/download/v3.1.0/qutebrowser-3.1.0.dmg";
      sha256 = "sha256-AvuuwUnxMcr2ekZ/O1FL/4IizV1aTMhXNrbf1SwNY7U=";
    };
  };
  sbarlua = {
    pname = "sbarlua";
    version = "29395b1928835efa1b376d438216fbf39e0d0f83";
    src = fetchFromGitHub {
      owner = "FelixKratz";
      repo = "SbarLua";
      rev = "29395b1928835efa1b376d438216fbf39e0d0f83";
      fetchSubmodules = false;
      sha256 = "sha256-C2tg1mypz/CdUmRJ4vloPckYfZrwHxc4v8hsEow4RZs=";
    };
    date = "2024-02-28";
  };
  skkeleton = {
    pname = "skkeleton";
    version = "342f71218dd08ad3053f141302db2fb1101f1213";
    src = fetchFromGitHub {
      owner = "vim-skk";
      repo = "skkeleton";
      rev = "342f71218dd08ad3053f141302db2fb1101f1213";
      fetchSubmodules = false;
      sha256 = "sha256-umpBr09lMSng44PQ3jauWVEi1EuVJ1A9+dOlLAONbTw=";
    };
    date = "2024-03-12";
  };
  vim-startuptime = {
    pname = "vim-startuptime";
    version = "1.3.2";
    src = fetchurl {
      url = "https://github.com/rhysd/vim-startuptime/archive/v1.3.2.tar.gz";
      sha256 = "sha256-1IB0DZJ+pAME35jxM1whJ/R+D6ZX9rjxHmXnQBX/IdQ=";
    };
  };
  vivaldi-darwin = {
    pname = "vivaldi-darwin";
    version = "6.6.3271.48";
    src = fetchurl {
      url = "https://downloads.vivaldi.com/stable/Vivaldi.6.6.3271.48.universal.dmg";
      sha256 = "sha256-qlqjF3Ff1+o8D6Fzjs/1TRJTK8x+GrQA38wy4f/h5U0=";
    };
  };
}
