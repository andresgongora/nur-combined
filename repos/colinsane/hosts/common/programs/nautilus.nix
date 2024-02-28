{ pkgs, ... }:
{
  sane.programs."gnome.nautilus" = {
    # some of its dbus services don't even refer to real paths
    packageUnwrapped = pkgs.rmDbusServicesInPlace (pkgs.gnome.nautilus.overrideAttrs (orig: {
      # enable the "Audio and Video Properties" pane. see: <https://nixos.wiki/wiki/Nautilus>
      buildInputs = orig.buildInputs ++ (with pkgs.gst_all_1; [
        gst-plugins-good
        gst-plugins-bad
      ]);
    }));

    sandbox.method = "bwrap";
    sandbox.whitelistDbus = [ "user" ];  # for portals launching apps
    sandbox.whitelistWayland = true;
    sandbox.extraHomePaths = [
      # grant access to pretty much everything, except for secret keys.
      "/"
      ".persist/ephemeral"
      ".persist/plaintext"
      "knowledge"
      "nixos"
    ];
    sandbox.extraPaths = [
      "/boot"
      "/mnt/desko"
      "/mnt/lappy"
      "/mnt/moby"
      "/mnt/servo"
      # "nix"
      "/run/media"  # for mounted devices
      "/tmp"
      "/var"
    ];
    sandbox.extraRuntimePaths = [
      # not sure if these are actually necessary
      "gvfs"
      "gvfsd"
    ];

    mime.priority = 150;  #< default is 100, so higher means we fall-back to other apps that might be more specialized
    mime.associations = {
      "inode/directory" = "org.gnome.Nautilus.desktop";
    };
  };
}
