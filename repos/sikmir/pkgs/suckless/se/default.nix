{
  lib,
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  ncurses,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "se";
  version = "3.0.1";

  src = fetchFromGitHub {
    owner = "screen-editor";
    repo = "se";
    rev = "se-${finalAttrs.version}";
    hash = "sha256-2LyYZXaL/Q3G/StCUiY6MUXG55g2YQvkpoF/lcsifD8=";
  };

  nativeBuildInputs = [ autoreconfHook ];

  buildInputs = [ ncurses ];

  meta = {
    description = "screen oriented version of the classic UNIX text editor ed";
    inherit (finalAttrs.src.meta) homepage;
    license = lib.licenses.publicDomain;
    platforms = lib.platforms.unix;
    maintainers = [ lib.maintainers.sikmir ];
  };
})
