# Terminal UI mail client
{ ... }:

{
  sane.programs.aerc = {
    sandbox.method = "bwrap";
    sandbox.wrapperType = "inplace";  #< /share/aerc/aerc.conf refers to other /share files by absolute path
    sandbox.net = "clearnet";
    secrets.".config/aerc/accounts.conf" = ../../../secrets/common/aerc_accounts.conf.bin;
    mime.associations."x-scheme-handler/mailto" = "aerc.desktop";
  };
}
