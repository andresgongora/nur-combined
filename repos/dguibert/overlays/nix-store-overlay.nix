nixDir:
self: super:
{
  nix = super.nix.override {
    storeDir = "${nixDir}/store";
    stateDir = "${nixDir}/var";
    confDir = "${nixDir}/etc";
  };

  nixUnstable = super.nixUnstable.override {
    storeDir = "${nixDir}/store";
    stateDir = "${nixDir}/var";
    confDir = "${nixDir}/etc";
  };
}
