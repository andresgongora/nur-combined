# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  kmonad = {
    pname = "kmonad";
    version = "9a97f4b04de689b36dc5db2aad28ba1c90878160";
    src = fetchFromGitHub {
      owner = "kmonad";
      repo = "kmonad";
      rev = "9a97f4b04de689b36dc5db2aad28ba1c90878160";
      fetchSubmodules = false;
      sha256 = "sha256-tBkXDAv3TJLV/aEWzq4aIPzE5kwSbtaOOK+P1UZGlNY=";
    };
    date = "2024-05-25";
  };
  taffybar = {
    pname = "taffybar";
    version = "a82a8a0cffb34b5eae38e46d88f02641bf8a8fe5";
    src = fetchFromGitHub {
      owner = "taffybar";
      repo = "taffybar";
      rev = "a82a8a0cffb34b5eae38e46d88f02641bf8a8fe5";
      fetchSubmodules = false;
      sha256 = "sha256-OZNPY2LNBm+NkIHqo8SX2f/BfuwqkQIGYePkiAmz2YA=";
    };
    date = "2024-05-02";
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
