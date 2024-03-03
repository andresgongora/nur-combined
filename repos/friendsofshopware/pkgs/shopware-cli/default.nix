# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    x86_64-linux = "0l0k3rr4b273vvzmwc8f9jmhn7yxfbha8mkbqmrhibckqfz39vps";
    aarch64-linux = "1gx3ywdxpkppnrwaxy4904hjz9s2jwrs95g44dzjcpysbdazass7";
    x86_64-darwin = "1hd1g73slp43dkzhqjyixzfyvh56jafb37jh240xdn3c27qpv6sh";
    aarch64-darwin = "1p1cjc6wm0v30i55qvqina6f085667mnqrqqaax2y6whsy930v90";
  };

  urlMap = {
    x86_64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.26/shopware-cli_Linux_x86_64.tar.gz";
    aarch64-linux = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.26/shopware-cli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.26/shopware-cli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/FriendsOfShopware/shopware-cli/releases/download/0.4.26/shopware-cli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "shopware-cli";
  version = "0.4.26";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./shopware-cli $out/bin/shopware-cli
  '';
  postInstall = ''
    installShellCompletion --cmd shopware-cli \
    --bash <($out/bin/shopware-cli completion bash) \
    --zsh <($out/bin/shopware-cli completion zsh) \
    --fish <($out/bin/shopware-cli completion fish)
  '';

  system = system;

  meta = {
    description = "Command line tool for Shopware 6";
    homepage = "https://sw-cli.fos.gg";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
