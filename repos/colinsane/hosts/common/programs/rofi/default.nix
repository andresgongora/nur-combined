# rofi: app-launcher/file-browser/omni-menu
#
# select options:
# - `rofi -show`
#   - use as a launcher/file browser
# - `rofi -sidebar-mode`
#   - separate tabs for filebrowser, drun, etc.
# - `rofi -pid /run/user/$UID/rofi.pid -replace`
#   - single-instance mode
#   - pid is probably optional, just need `-replace`.
#
# ROFI POWERSCRIPTS/EXTENSIONS/PLUGINS:
# collections:
# - <https://github.com/adi1090x/rofi>
# - <https://github.com/giomatfois62/rofi-desktop>
#   - turns rofi into a hierarchical menu, like sxmo
#
# - <https://github.com/adi1090x/rofi>
# - <https://github.com/marvinkreis/rofi-file-browser-extended>
# - <https://github.com/Mange/rofi-emoji>
# - <https://github.com/fdw/rofimoji>
# - <https://github.com/jluttine/rofi-power-menu>
# - <https://github.com/ceuk/rofi-screenshot>
# - <https://gitlab.com/DamienCassou/rofi-pulse-select>
{ pkgs, ... }:
let
  rofi-unwrapped = pkgs.rofi-wayland-unwrapped.overrideAttrs (upstream: {
    patches = (upstream.patches or []) ++ [
      (pkgs.fetchpatch {
        url = "https://git.uninsane.org/colin/rofi/commit/8e01fcd16f97f4c2a5bc63ade58c894a938f89d9.patch";
        name = "run-{shell-,}command: expand `{app_id}` inside the template string";
        hash = "sha256-DXafvvKrNyDOH11lpRdC2ljydb422ttY68oY5K3fKWo=";
      })
      (pkgs.fetchpatch {
        url = "https://git.uninsane.org/colin/rofi/commit/249450a2b58c3cf7ced911cadb8c4c60d3315dd0.patch";
        name = "filebrowser: include entries of d_type DT_UNKNOWN";
        hash = "sha256-gz3N4uo7IWzzqaPHHVhby/e9NbtzcFJRQwgdNYxO/Yw=";
      })
    ];

    nativeBuildInputs = (upstream.nativeBuildInputs or []) ++ [
      pkgs.copyDesktopItems
    ];
    desktopItems = (upstream.desktopItems or []) ++ [
      (pkgs.makeDesktopItem {
        name = "rofi-filebrowser";
        # alternatively: `rofi -modes filebrowser -show`, however this would require theme tweaking to look good
        exec = "rofi -combi-modes filebrowser -show";
        desktopName = "rofi filebrowser";
      })
    ];
  });
  # rofi-emoji = pkgs.rofi-emoji.override {
  #   # plugins must be compiled against the same rofi they're loaded by
  #   inherit rofi-unwrapped;
  # };
  # rofi-file-browser = pkgs.rofi-file-browser.override {
  #   # plugins must be compiled against the same rofi they're loaded by
  #   rofi = rofi-unwrapped;
  # };
in
{
  sane.programs.rofi = {
    # 2024/02/26: wayland is only supported by the fork: <https://github.com/lbonn/rofi>.
    # it's actively maintained though, and more of an overlay than a true fork.
    packageUnwrapped = pkgs.rofi-wayland.override {
      inherit rofi-unwrapped;
      plugins = [
        # rofi-[extended-]-file-browser: <https://github.com/marvinkreis/rofi-file-browser-extended>
        # because the builtin rofi filebrowser only partially lists ~/Videos/servo/Shows, seemingly at random.
        # but rofi-file-browser doesn't compile against my patched rofi (oops)
        # rofi-file-browser

        # rofi-emoji: "insert" mode doesn't work; use a wrapper like `splatmoji` instead.
        # rofi-emoji
      ];
    };

    suggestedPrograms = [
      "rofi-run-command"
    ];

    sandbox.method = "bwrap";
    sandbox.whitelistDbus = [ "user" ];  #< to launch apps via the portal
    sandbox.whitelistWayland = true;
    sandbox.extraHomePaths = [
      ".local/share/applications"  #< to locate .desktop files
      "Books/local"
      "Books/servo"
      "Music"
      "Pictures/albums"
      "Pictures/cat"
      "Pictures/from"
      "Pictures/Photos"
      "Pictures/Screenshots"
      "Pictures/servo-macros"
      "Videos/gPodder"
      "Videos/local"
      "Videos/servo"
      "knowledge"
      "tmp"
    ];
    sandbox.extraPaths = [
      "/mnt/servo/media"
      "/mnt/servo/playground"
    ];

    fs.".config/rofi/config.rasi".symlink.target = ./config.rasi;
    persist.byStore.cryptClearOnBoot = [
      # this gets us a few things:
      # - file browser remembers its last directory
      # - caching of .desktop files (perf)
      ".cache/rofi"
    ];
  };

  sane.programs.rofi-run-command = {
    packageUnwrapped = pkgs.static-nix-shell.mkBash {
      pname = "rofi-run-command";
      srcRoot = ./.;
      pkgs = [ "sane-open-desktop" "xdg-utils" ];
    };
    sandbox.enable = false;  #< trivial script, and all our deps are sandboxed

    suggestedPrograms = [
      "sane-open-desktop"
      "xdg-utils"
    ];
  };

  sane.programs.rofi-snippets = {
    packageUnwrapped = pkgs.static-nix-shell.mkBash {
      pname = "rofi-snippets";
      srcRoot = ./.;
      pkgs = [
        "gnused"
        "rofi"
        "wtype"
      ];
      nativeBuildInputs = [
        pkgs.copyDesktopItems
      ];
      desktopItems = [
        (pkgs.makeDesktopItem {
          name = "rofi-snippets";
          exec = "rofi-snippets";
          desktopName = "rofi macro to insert common texts";
        })
      ];
    };
    # if i could remove the sed, then maybe possible to not sandbox.
    sandbox.method = "bwrap";
    sandbox.whitelistWayland = true;
    sandbox.extraHomePaths = [
      ".cache/rofi"
      ".config/rofi/config.rasi"
    ];

    suggestedPrograms = [ "rofi" ];

    fs.".config/rofi-snippets/public.txt".symlink.target = ./snippets.txt;
    secrets.".config/rofi-snippets/private.txt" = ../../../../secrets/common/snippets.txt.bin;
  };
}
