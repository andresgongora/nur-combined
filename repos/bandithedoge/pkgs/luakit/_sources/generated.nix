# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  luakit = {
    pname = "luakit";
    version = "c4000ed93fa8d419b327e703704369bae23d8ebd";
    src = fetchFromGitHub {
      owner = "luakit";
      repo = "luakit";
      rev = "c4000ed93fa8d419b327e703704369bae23d8ebd";
      fetchSubmodules = false;
      sha256 = "sha256-1LeherLqNJGINbUh5eJe7y5TPL3nPUm734libl8xliU=";
    };
    date = "2024-01-30";
  };
}
