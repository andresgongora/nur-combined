{ data, user, ... }:
let
  hostPrivKey = "/persist/keys/ssh_host_ed25519_key";
in
{
  age = {
    identityPaths = [ hostPrivKey ];
    rekey.hostPubkey = data.keys.kaamblHostPubKey;
    secrets = {
      id = {
        rekeyFile = ../../sec/id.age;
        mode = "400";
        owner = user;
        group = "users";
      };
      id_sk = {
        rekeyFile = ../../sec/id_sk.age;
        mode = "400";
        owner = user;
        group = "users";
      };
      addr-map = {
        rekeyFile = ../../sec/addr-map.age;
        mode = "640";
        owner = user;
        group = "root";
        name = "addr-map";
      };
    };
  };
  services.openssh.hostKeys = [
    {
      path = hostPrivKey;
      type = "ed25519";
    }
  ];
}
