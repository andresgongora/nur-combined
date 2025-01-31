{ lib, ... }:
{
  perSystem =
    {
      pkgs,
      config,
      inputs',
      ...
    }:
    let
      commands = rec {
        ci = ''
          set -euo pipefail
          if [ "$1" == "" ]; then
            echo "Usage: ci <system>";
            exit 1;
          fi

          NIX_LOGFILE=nix-build-uncached.log

          # Workaround https://github.com/NixOS/nix/issues/6572
          for i in {1..3}; do
            ${pkgs.nix-build-uncached}/bin/nix-build-uncached ci.nix -A $1 --show-trace 2>&1 | tee $NIX_LOGFILE && exit 0
            if grep -q "specified:" $NIX_LOGFILE; then
              if grep -q "got:" $NIX_LOGFILE; then
                SAVEIFS=$IFS
                IFS=$'\n'

                SPECIFIED_HASH=($(grep "specified:" $NIX_LOGFILE | cut -d":" -f2))
                GOT_HASH=($(grep "got:" $NIX_LOGFILE | cut -d":" -f2))

                IFS=$SAVEIFS

                for (( i=0; i<''${#SPECIFIED_HASH[@]}; i++ )); do
                  echo "Auto replace ''${SPECIFIED_HASH[$i]} with ''${GOT_HASH[$i]}"
                  sed -i "s#''${SPECIFIED_HASH[$i]}#''${GOT_HASH[$i]}#g" $(find pkgs/ -name \*.nix) || true
                  SPECIFIED_HASH_OLD=$(nix hash convert --to nix32 "''${SPECIFIED_HASH[$i]}")
                  echo "Auto replace ''${SPECIFIED_HASH_OLD} with ''${GOT_HASH[$i]}"
                  sed -i "s#''${SPECIFIED_HASH_OLD}#''${GOT_HASH[$i]}#g" $(find pkgs/ -name \*.nix) || true
                done
              fi
            fi
            rm -f $NIX_LOGFILE
          done

          exit 1
        '';

        nvfetcher = ''
          set -euo pipefail
          KEY_FLAG=""
          [ -f "$HOME/Secrets/nvfetcher.toml" ] && KEY_FLAG="$KEY_FLAG -k $HOME/Secrets/nvfetcher.toml"
          [ -f "secrets.toml" ] && KEY_FLAG="$KEY_FLAG -k secrets.toml"
          export PYTHONPATH=${pkgs.python3Packages.packaging}/lib/python${pkgs.python3.pythonVersion}/site-packages:''${PYTHONPATH:-}
          ${inputs'.nvfetcher.packages.default}/bin/nvfetcher $KEY_FLAG --keep-going -c nvfetcher.toml -o _sources "$@"
          ${readme}
        '';

        nur-check = ''
          set -euo pipefail
          TMPDIR=$(mktemp -d)
          FLAKEDIR=$(pwd)

          git clone --depth=1 https://github.com/nix-community/NUR.git "$TMPDIR"
          cd "$TMPDIR"

          cp ${../../repos.json} repos.json
          rm -f repos.json.lock

          bin/nur update
          bin/nur eval "$FLAKEDIR"

          git clone --single-branch "https://github.com/nix-community/nur-combined.git"
          cp repos.json repos.json.lock nur-combined/
          bin/nur index nur-combined > index.json

          cd "$FLAKEDIR"
          rm -rf "$TMPDIR"
        '';

        readme = ''
          set -euo pipefail
          nix build .#_meta.readme
          cat result > README.md
          nix search . ^ --json | ${pkgs.jq}/bin/jq > nix-packages.json
        '';

        search-lib = ''
          ${inputs'.nix-index-database.packages.default}/bin/nix-locate -w "$@" | grep -v "("
        '';

        trace = ''
          rm -rf trace.txt*
          strace -ff --trace=%file -o trace.txt "$@"
        '';

        update =
          let
            py = pkgs.python3.withPackages (p: with p; [ requests ]);
          in
          ''
            set -euo pipefail
            export PATH=${pkgs.nix-prefetch-git}/bin:$PATH
            nix flake update
            ${nvfetcher}
            ${py}/bin/python3 pkgs/asterisk-digium-codecs/update.py
            ${py}/bin/python3 pkgs/nvidia-grid/update.py
            ${py}/bin/python3 pkgs/openj9-ibm-semeru/update.py
            ${py}/bin/python3 pkgs/openjdk-adoptium/update.py
            ${readme}
          '';
      };
    in
    rec {
      apps = lib.mapAttrs (n: v: {
        type = "app";
        program = pkgs.writeShellScriptBin n v;
      }) commands;

      devShells.default = pkgs.mkShell {
        nativeBuildInputs = config.pre-commit.settings.enabledPackages ++ [
          config.pre-commit.settings.package
        ];
        shellHook = config.pre-commit.installationScript;

        buildInputs = lib.mapAttrsToList (
          n: _v:
          pkgs.writeShellScriptBin n ''
            exec nix run .#${n} -- "$@"
          ''
        ) apps;
      };
    };
}
