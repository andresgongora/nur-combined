# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  dmenu-flexipatch = {
    pname = "dmenu-flexipatch";
    version = "9ef1b3c317d6395ac7fd2c6951d356e9990ce23d";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dmenu-flexipatch";
      rev = "9ef1b3c317d6395ac7fd2c6951d356e9990ce23d";
      fetchSubmodules = false;
      sha256 = "sha256-2mr+qT6CZJohMG05itxp63eCNfZEJqKD4BLp/GP5ZCA=";
    };
    date = "2024-05-17";
  };
  dwm-flexipatch = {
    pname = "dwm-flexipatch";
    version = "c1e9e0b035293ef5d5bfdc4b40dd2a94975047d0";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dwm-flexipatch";
      rev = "c1e9e0b035293ef5d5bfdc4b40dd2a94975047d0";
      fetchSubmodules = false;
      sha256 = "sha256-YVcsDpdxTyIoT6N1NKfUkQLChYkWtYZWqnJ9PtYY5Bc=";
    };
    date = "2024-06-13";
  };
  slock-flexipatch = {
    pname = "slock-flexipatch";
    version = "316de8856f9f25685f6f1c4e94dbf76e4f64c06b";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "slock-flexipatch";
      rev = "316de8856f9f25685f6f1c4e94dbf76e4f64c06b";
      fetchSubmodules = false;
      sha256 = "sha256-jsAfkd2Xtzp4zKwY0bExPhVtcs+OeBdGJA29SPC04jk=";
    };
    date = "2023-10-06";
  };
  st-flexipatch = {
    pname = "st-flexipatch";
    version = "546dd288c02cdab44e92fbfbbe86de57c680e1e1";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "st-flexipatch";
      rev = "546dd288c02cdab44e92fbfbbe86de57c680e1e1";
      fetchSubmodules = false;
      sha256 = "sha256-uZoSwfDaUd/1URPH2mn8/6uDhUaOGeYhXDTiM41FtS0=";
    };
    date = "2024-06-14";
  };
}
