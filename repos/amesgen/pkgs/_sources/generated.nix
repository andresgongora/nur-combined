# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  cabal-docspec = {
    pname = "cabal-docspec";
    version = "0.0.0.20231219";
    src = fetchurl {
      url = "https://github.com/phadej/cabal-extras/releases/download/cabal-docspec-0.0.0.20231219/cabal-docspec-0.0.0.20231219-x86_64-linux.xz";
      sha256 = "sha256-i2BEgnVGa74rlAl0G13QekHFQSgwF7lbRO/m4xN50Gc=";
    };
  };
  cabal-docspec-man = {
    pname = "cabal-docspec-man";
    version = "0.0.0.20231219";
    src = fetchurl {
      url = "https://raw.githubusercontent.com/phadej/cabal-extras/cabal-docspec-0.0.0.20231219/cabal-docspec/cabal-docspec.1";
      sha256 = "sha256-tyVrIqUx6XrCAqXGLeOfsbdny5ue8tY30vyGrArdl7w=";
    };
  };
  cabal-gild = {
    pname = "cabal-gild";
    version = "1.0.2.1";
    src = fetchurl {
      url = "https://github.com/tfausak/cabal-gild/releases/download/1.0.2.1/cabal-gild-1.0.2.1-linux-x64.tar.gz";
      sha256 = "sha256-06UYNwLrhM79TCoJoF0Y6lnScBFYJuaWqmtHoZNVY1A=";
    };
  };
  cabal-plan = {
    pname = "cabal-plan";
    version = "0.7.3.0";
    src = fetchurl {
      url = "https://github.com/haskell-hvr/cabal-plan/releases/download/v0.7.3.0/cabal-plan-0.7.3.0-x86_64-linux.xz";
      sha256 = "sha256-9izLKXFWel9jjyAFrTFz26FGk6RRVMFQhkXFIolxTLI=";
    };
  };
  fourmolu = {
    pname = "fourmolu";
    version = "0.15.0.0";
    src = fetchurl {
      url = "https://github.com/fourmolu/fourmolu/releases/download/v0.15.0.0/fourmolu-0.15.0.0-linux-x86_64";
      sha256 = "sha256-s8x2jUpCsOXXmthBNn64mrEDdk92x3D2+m4VwWk6PmY=";
    };
  };
  hellsmack = {
    pname = "hellsmack";
    version = "0.1.2.6";
    src = fetchurl {
      url = "https://github.com/amesgen/hellsmack/releases/download/v0.1.2.6/hellsmack-Linux.zip";
      sha256 = "sha256-Bykic44/DRWKqzdgTyMGYI5luQzr3zt9UlYxGIstRj8=";
    };
  };
  hlint = {
    pname = "hlint";
    version = "3.8";
    src = fetchurl {
      url = "https://github.com/ndmitchell/hlint/releases/download/v3.8/hlint-3.8-x86_64-linux.tar.gz";
      sha256 = "sha256-iCNjhyBkxwgBhYtOn6F0aFMfwwuR7VuNJg60j8kLPmE=";
    };
  };
  ormolu = {
    pname = "ormolu";
    version = "0.7.4.0";
    src = fetchurl {
      url = "https://github.com/tweag/ormolu/releases/download/0.7.4.0/ormolu-Linux.zip";
      sha256 = "sha256-Pp88TsPT1YlV/fbHtlzoadPfOq+rMXDeHeYAsJ3SKR8=";
    };
  };
}
