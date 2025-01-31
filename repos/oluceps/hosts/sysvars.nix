{
  user,
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.sessionVariables = {
    # SYSTEMD_LOG_LEVEL = "debug";
    EDITOR = "hx";
    NIXOS_OZONE_WL = "1";
    # Steam needs this to find Proton-GE
    AWS_SHARED_CREDENTIALS_FILE = config.age.secrets.aws-s3-cred.path;
    GOPATH = "\${HOME}/.cache/go";
    # NIX_CFLAGS_COMPILE = "--verbose";
    # NIX_CFLAGS_LINK = "--verbose";
    # NIX_LDFLAGS = "--verbose";
    # WLR_RENDERER = "vulkan";
    PATH = [ "/home/${user}/.npm-packages/bin" ];
    RAD_HOME = "/home/${user}/.local/share/radicle";
    NTFY_AUTH_FILE = config.services.ntfy-sh.settings.auth-file or "";
    # LD_LIBRARY_PATH = [ "${lib.getLib pkgs.pcsclite}/lib" ];
    DIRENV_CONFIG = "/etc/direnv";
  };
}
