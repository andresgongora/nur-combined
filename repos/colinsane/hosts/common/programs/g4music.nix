# N.B.: requires first-run setup on moby:
# - UI will render transparent
# - click the hamburger (top-right: immediately left from close button)
#   > Preferences
#     > Background-blur mode: change from "Always" to "Never"
#
# the background blur is probably some dconf setting somewhere.
{ ... }:
{
  sane.programs.g4music = {
    sandbox.method = "bwrap";
    sandbox.whitelistAudio = true;
    sandbox.whitelistDbus = [ "user" ];  # mpris
    sandbox.whitelistWayland = true;
    sandbox.extraHomePaths = [
      "Music"
    ];

    persist.byStore.plaintext = [
      # index?
      ".cache/com.github.neithern.g4music"
    ];
  };
}
