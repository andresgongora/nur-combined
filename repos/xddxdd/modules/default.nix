{
  pkgs,
  linux-xanmod-lantian,
  ...
}:

{
  # Add your NixOS modules here
  #
  # my-module = ./my-module;
  linux-xanmod-lantian = pkgs.linuxKernel.packagesFor linux-xanmod-lantian;
}
