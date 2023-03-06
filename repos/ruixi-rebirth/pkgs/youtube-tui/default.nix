{ stdenv
, lib
, fetchCrate
, rustPlatform
, pkg-config
, libsixel
, libxcb
, openssl
, python3
, pkgs
}:
rustPlatform.buildRustPackage rec {
  pname = "youtube-tui";
  version = "0.7.0";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-Rz13mGqxfCU+6k2Ejvk+ZoaLirDT6VkmAIhvFdNRvuI=";
  };
  cargoHash = "sha256-qcWuh8qaOQBBebdX3D01k5yXZfifbFC+ZP0d6bJeOr0=";
  nativeBuildInputs = [ pkg-config python3 ];
  buildInputs = [ libsixel libxcb pkg-config openssl ];

  doCheck = false;
}
