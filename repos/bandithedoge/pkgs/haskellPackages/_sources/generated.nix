# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  kmonad = {
    pname = "kmonad";
    version = "e7ea8944d665076a2f3a5c229ae1fd84220c2c82";
    src = fetchFromGitHub {
      owner = "kmonad";
      repo = "kmonad";
      rev = "e7ea8944d665076a2f3a5c229ae1fd84220c2c82";
      fetchSubmodules = false;
      sha256 = "sha256-dlCQQE4g2HROi+CroNSlwSZfhwU3uFmtnETS97V0SYs=";
    };
    date = "2024-02-03";
  };
  taffybar = {
    pname = "taffybar";
    version = "9c8540a56432db6555755a9a649b4874833520ed";
    src = fetchFromGitHub {
      owner = "taffybar";
      repo = "taffybar";
      rev = "9c8540a56432db6555755a9a649b4874833520ed";
      fetchSubmodules = false;
      sha256 = "sha256-O5T4/1+dERQitmA6pwcP67/tREcJQ7KuATD8kGiB2Es=";
    };
    date = "2024-01-30";
  };
  xmonad-entryhelper = {
    pname = "xmonad-entryhelper";
    version = "ee2d0c14f9258503d7bd62907aa731dd64fa34d0";
    src = fetchFromGitHub {
      owner = "Javran";
      repo = "xmonad-entryhelper";
      rev = "ee2d0c14f9258503d7bd62907aa731dd64fa34d0";
      fetchSubmodules = false;
      sha256 = "sha256-CGaibR0Yejng9IQInm92Zx0pEZS29tJjWvPgaiWgUNQ=";
    };
    date = "2022-05-18";
  };
}
