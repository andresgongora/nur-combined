# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  luakit = {
    pname = "luakit";
    version = "6d3a9fd578a02e4f2a591a3e540ab98dcaa485cf";
    src = fetchFromGitHub {
      owner = "luakit";
      repo = "luakit";
      rev = "6d3a9fd578a02e4f2a591a3e540ab98dcaa485cf";
      fetchSubmodules = false;
      sha256 = "sha256-vAefsoK6qGMRguDVwehMwhxcjlzmzaFILVxvkhMgzBE=";
    };
    date = "2024-02-08";
  };
}
