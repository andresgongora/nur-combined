# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  clap-info = {
    pname = "clap-info";
    version = "v1.2.0";
    src = fetchFromGitHub {
      owner = "free-audio";
      repo = "clap-info";
      rev = "v1.2.0";
      fetchSubmodules = true;
      sha256 = "sha256-efZexmsOuZskei34z9Lj2xdDOkEOYod8rqtOrVghMxw=";
    };
  };
}
