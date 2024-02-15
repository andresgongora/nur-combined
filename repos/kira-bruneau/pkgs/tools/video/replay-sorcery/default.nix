{ lib
, stdenv
, fetchFromGitHub
, substituteAll
, cmake
, pkg-config
, ffmpeg
, libX11
, drmSupport ? true
, libdrm
, notifySupport ? true
, libnotify
, pulseaudioSupport ? true
, libpulseaudio
, nix-update-script
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "replay-sorcery";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "matanui159";
    repo = "ReplaySorcery";
    rev = "refs/tags/${finalAttrs.version}";
    fetchSubmodules = true;
    sha256 = "sha256-HPkSOwfwcg4jLUzKfqdXgLu7mgD5H4wb9d2BrqWQeHc=";
  };

  patches = [
    # Use global config generated by NixOS (/etc/replay-sorcery.conf)
    # instead of $out/etc/replay-sorcery.conf.
    ./fix-global-config.patch
  ] ++ lib.optional notifySupport (substituteAll {
    # Patch in libnotify if support is enabled. Can't use makeWrapper
    # since it would break the security wrapper in the NixOS module.
    src = ./hardcode-libnotify.patch;
    inherit libnotify;
  });

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [ ffmpeg libX11 ]
    ++ lib.optional drmSupport libdrm
    ++ lib.optional pulseaudioSupport libpulseaudio;

  cmakeFlags = [
    "-DRS_SYSTEMD_DIR=${placeholder "out"}/lib/systemd/user"

    # SETUID & SETGID permissions required for hardware accelerated
    # video capture can't be set during the build. Use the NixOS
    # module if you want hardware accelerated video capture.
    "-DRS_SETID=OFF"
  ];

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "An open-source, instant-replay solution for Linux";
    homepage = "https://github.com/matanui159/ReplaySorcery";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ kira-bruneau ];
    platforms = platforms.linux;
    mainProgram = "replay-sorcery";
  };
})
