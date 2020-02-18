{ callPackage }:

rec {
  blurhash = callPackage ./blurhash.nix {};

  jupyterthemes = callPackage ./jupyterthemes.nix {
    inherit lesscpy;
  };

  frida = callPackage ./frida.nix {};

  http_ece = callPackage ./http_ece.nix {};

  ldap0 = callPackage ./ldap0.nix {};

  Mastodon = callPackage ./Mastodon.nix {
    inherit http_ece blurhash;
  };

  pygatt = callPackage ./pygatt.nix {};

  lesscpy = callPackage ./lesscpy.nix {};

  pry = callPackage ./pry.nix {};

  priority = callPackage ./priority.nix {};

  remote-pdb = callPackage ./remote-pdb.nix {};
}
