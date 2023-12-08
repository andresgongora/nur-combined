# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  carla-git = {
    pname = "carla-git";
    version = "bcfcafd2adfa2cabd1c823ef026aaaa79a7fb73c";
    src = fetchFromGitHub {
      owner = "falkTX";
      repo = "Carla";
      rev = "bcfcafd2adfa2cabd1c823ef026aaaa79a7fb73c";
      fetchSubmodules = false;
      sha256 = "sha256-zCeIClKm1HQB6nHcRPjl8Zj2ubKGfutyCd46nQtOaIQ=";
    };
    date = "2023-12-08";
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
  libadwaita-1_4 = {
    pname = "libadwaita-1_4";
    version = "1.4.rc";
    src = fetchFromGitHub {
      owner = "GNOME";
      repo = "libadwaita";
      rev = "1.4.rc";
      fetchSubmodules = false;
      sha256 = "sha256-VJV5kLoDXTPXb3gXz0iANmrfo+wiR4a59Z2tcjL5+/8=";
    };
  };
  zix-git = {
    pname = "zix-git";
    version = "08954c900820320064d2e33445858e1ef5024a0b";
    src = fetchFromGitHub {
      owner = "drobilla";
      repo = "zix";
      rev = "08954c900820320064d2e33445858e1ef5024a0b";
      fetchSubmodules = false;
      sha256 = "sha256-iMJUgobKNw+h8MRzziDHOD/3BBeuVd2tHvCYrRlF4G4=";
    };
    date = "2023-12-02";
  };
  zrythm = {
    pname = "zrythm";
    version = "228c7ad526b354c9ba01bed71028b9cb422f73f0";
    src = fetchgit {
      url = "https://git.sr.ht/~alextee/zrythm";
      rev = "228c7ad526b354c9ba01bed71028b9cb422f73f0";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-G7U9GI5B3o2MuS6saZk+yeu1YBdY2iY1QGbksoDpY58=";
    };
    date = "2023-09-02";
  };
}
