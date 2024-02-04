# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  carla-git = {
    pname = "carla-git";
    version = "df1f800a3979dcf91fc9c36116a65a324c1176a7";
    src = fetchFromGitHub {
      owner = "falkTX";
      repo = "Carla";
      rev = "df1f800a3979dcf91fc9c36116a65a324c1176a7";
      fetchSubmodules = false;
      sha256 = "sha256-Txq/SH3EfNBJsntLrglcr8N1u0FptU4VbvjOsB4+w7c=";
    };
    date = "2024-02-03";
  };
  gtk-4_13_0 = {
    pname = "gtk-4_13_0";
    version = "4.13.0";
    src = fetchFromGitHub {
      owner = "GNOME";
      repo = "gtk";
      rev = "4.13.0";
      fetchSubmodules = false;
      sha256 = "sha256-SiL+/wfpeIUF2sQpGN1nWVn/mna+m3UxfORAFq/8fl0=";
    };
  };
  rtaudio-git = {
    pname = "rtaudio-git";
    version = "6.0.1";
    src = fetchFromGitHub {
      owner = "thestk";
      repo = "rtaudio";
      rev = "6.0.1";
      fetchSubmodules = false;
      sha256 = "sha256-Acsxbnl+V+Y4mKC1gD11n0m03E96HMK+oEY/YV7rlIY=";
    };
  };
  zrythm = {
    pname = "zrythm";
    version = "d62f5c8a5015aea4780d419c7e549f2dc2483b2c";
    src = fetchgit {
      url = "https://gitlab.zrythm.org/zrythm/zrythm.git";
      rev = "d62f5c8a5015aea4780d419c7e549f2dc2483b2c";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-UtWsni01rvZAsLizCTsyezch4IHsbdNGzRinmjiHM+o=";
    };
    date = "2024-02-04";
  };
}
