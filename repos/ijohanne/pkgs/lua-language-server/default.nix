{ stdenv
, fetchFromGitHub
, pkgconfig
, makeWrapper
, lua52Packages
, ncurses
, ninja
, readline
, zlib
, lib
, sources
}:
with lib;
stdenv.mkDerivation rec {
  pname = "lua-language-server";
  version = "master";

  src = fetchFromGitHub {
    inherit (sources.lua-language-server) owner repo rev;
    sha256 = "1zak0j23ihzyh9by6bgprn9ymp853sbhyarvcbqficb29zm31k4k";
    fetchSubmodules = true;
  };

  buildPhase = ''
    cd 3rd/luamake
    patchShebangs compile/install.sh
    compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp bin/Linux/lua-language-server $out/bin
  '';

  nativeBuildInputs = [
    pkgconfig
    makeWrapper
    ninja
  ];

  buildInputs = [
    lua52Packages.lua
    ncurses
    readline
    zlib
  ];

  meta = with lib; {
    description = "Lua language server";
    homepage = "https://github.com/sumneko/lua-language-server";
    platforms = with platforms; linux ++ darwin;
  };
}
