{ lib, stdenv, fetchFromGitHub, buildLinux, ... } @ args:

let
  modDirVersion = "6.5.4-sunlight1";
  parts = lib.splitString "-" modDirVersion;
  version = lib.elemAt parts 0;
  suffix = lib.elemAt parts 1;
  extraVer = "-lowlatency";
  hash = "sha256-gbWQoaV0+btSUflm6zh8+QgDPnoaSVqja8lWeb7t+dE=";

  numbers = lib.splitString "." version;
  branch = "${lib.elemAt numbers 0}.${lib.elemAt numbers 1}";
  rev = if ((lib.elemAt numbers 2) == "0") then "${branch}-${suffix}${extraVer}" else "${modDirVersion}${extraVer}";
in
buildLinux (args // rec {
    inherit version modDirVersion;

    src = fetchFromGitHub {
      owner = "sunlightlinux";
      repo = "linux-sunlight";
      rev = "385f487adb3d2add006fbacbe5fc35eab3926ac9"; 
      inherit hash;
    };

    structuredExtraConfig = with lib.kernel; {
      # Expert option for built-in default values.
      GKI_HACKS_TO_FIX = yes;

      # AMD P-state driver.
      X86_AMD_PSTATE = lib.mkOverride 60 yes;
      X86_AMD_PSTATE_UT = no;

      # FQ-PIE Packet Scheduling.
      NET_SCH_DEFAULT = yes;
      DEFAULT_FQ_PIE = yes;

      # Futex WAIT_MULTIPLE implementation for Wine / Proton Fsync.
      FUTEX = yes;
      FUTEX_PI = yes;

      # Preemptive Full Tickless Kernel at 858Hz.
      LATENCYTOP = yes;

      PREEMPT = lib.mkOverride 60 yes;
      PREEMPT_VOLUNTARY = lib.mkForce no;
      PREEMPT_NONE = lib.mkForce no;

      # WineSync driver for fast kernel-backed Wine.
      WINESYNC = module;

      # 858 Hz is alternative to 1000 Hz.
      # Selected value for a balance between latency, performance and low power consumption.
      HZ = freeform "858";
      HZ_858 = yes;
      HZ_1000 = no;

      SCHEDSTATS = lib.mkOverride 60 yes;
      HID = yes;
      UHID = yes;
    };

    extraMeta = {
      inherit branch;
      maintainers = with lib.maintainers; [ ];
      description = "Sunlight Kernel. Built with custom settings and new features
                     built to provide a stable, responsive and smooth desktop experience";
      broken = stdenv.isAarch64;
    };
} // (args.argsOverride or { }))
