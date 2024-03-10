{
  stdenv,
  lib,
  sources,
  kernel,
}:
stdenv.mkDerivation rec {
  inherit (sources.dpdk-kmod) pname version src;

  preConfigure = ''
    cd linux/igb_uio
  '';

  hardeningDisable = ["pic" "format"];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  KSRC = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
  INSTALL_MOD_PATH = placeholder "out";

  inherit (kernel) makeFlags;
  preBuild = ''
    makeFlags="$makeFlags -C ${KSRC} M=$(pwd)"
  '';
  installTargets = ["modules_install"];

  meta = {
    description = "DPDK kernel modules or add-ons";
    homepage = "https://git.dpdk.org/dpdk-kmods/";
    license = lib.licenses.gpl2;
    platforms = lib.platforms.linux;
  };
}
