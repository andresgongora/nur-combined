{
  lib,
  user,
  inputs,
  ...
}:
{
  deployment = {
    targetHost = "nyaw.xyz";
    targetPort = 22;
    targetUser = user;
    privilegeEscalationCommand = [
      "doas"
      "--"
    ];
  };

  imports = lib.sharedModules ++ [
    ../../srv
    ../sysvars.nix
    ./hardware.nix
    ./network.nix
    ./rekey.nix
    ./spec.nix
    ./caddy.nix
    ../../age.nix
    ../../packages.nix
    ../../misc.nix
    ../../users.nix

    inputs.factorio-manager.nixosModules.default
    inputs.tg-online-keeper.nixosModules.default
  ];
}
