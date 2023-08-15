{ stdenv
, lib
, fetchFromGitHub
, pkgconfig
, autoreconfHook
, curl
, fuse
, intltool
, jansson
, libevent
, libsearpc
, libtool
, libuuid
, libwebsockets
, openssl
, python3
, sqlite
, vala
, nix-update-script
}:

stdenv.mkDerivation rec {
  pname = "seadrive-fuse";
  version = "2.0.28";

  src = fetchFromGitHub {
    owner = "haiwen";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-EQtJFQ4b9enmawjV/GM6GQ/GwmRc6P8wh2AI3A1Q5so=";
  };

  nativeBuildInputs = [ autoreconfHook pkgconfig ];
  buildInputs = [
    curl
    fuse
    intltool
    jansson
    libevent
    libsearpc
    libtool
    libuuid
    libwebsockets
    openssl.dev
    python3
    sqlite
    vala
  ];

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    homepage = "https://github.com/haiwen/seadrive-fuse";
    description = "SeaDrive daemon with FUSE interface";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ataraxiasjel ];
  };
}
