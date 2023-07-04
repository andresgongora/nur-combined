{
  buildGoModule,
  lib,
  installShellFiles,
  fetchFromGitHub,
}: let
  sha = "69aa892";
in
  buildGoModule rec {
    pname = "deck";
    version = "1.23.0";
    src = fetchFromGitHub {
      owner = "Kong";
      repo = "deck";
      rev = "v${version}";
      hash = "sha256-PrpiZBGNb8tWt2RiZ4iHKibN+2EQRm1/tBbDLng/lkA=";
    };

    nativeBuildInputs = [installShellFiles];

    CGO_ENABLED = 0;

    ldflags = [
      "-s -w -X github.com/kong/deck/cmd.VERSION=${version}"
      "-X github.com/kong/deck/cmd.COMMIT=${sha}"
    ];

    vendorHash = "sha256-brd+gtIHIarMv3l6O6JMDPRFlMwKSLZjBABAvByUC6o=";

    postInstall = ''
      installShellCompletion --cmd deck \
        --bash <($out/bin/deck completion bash) \
        --fish <($out/bin/deck completion fish) \
        --zsh <($out/bin/deck completion zsh)
    '';

    meta = with lib; {
      description = "decK: Configuration management and drift detection for Kong.";
      homepage = "https://github.com/Kong/deck";
      license = licenses.asl20;
    };
  }
