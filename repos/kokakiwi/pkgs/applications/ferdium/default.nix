{ lib
, stdenv
, stdenvNoCC

, fetchFromGitHub

, makeDesktopItem
, makeWrapper
, wrapGAppsHook

, cacert
, electron
, gitMinimal
, jq
, moreutils
, nodePackages
}: let
  fixupPackageJson = {
    pnpmPatch = builtins.toJSON {
      pnpm.supportedArchitectures = {
        os = [ "linux" ];
        cpu = [ "x64" "arm64" ];
      };
      engines = {
        node = nodePackages.nodejs.version;
        pnpm = nodePackages.pnpm.version;
        electron = electron.version;
      };
    };

    patch = ''
      mv package.json package.json.orig
      jq --raw-output ". * $pnpmPatch" package.json.orig > package.json
    '';
  };

  mkPnpmDeps = {
    pname,
    hash,
    ...
  } @ args: stdenvNoCC.mkDerivation ({
    pname = "${pname}-pnpm-deps";

    nativeBuildInputs = [
      cacert
      jq
      moreutils
      nodePackages.pnpm
    ];

    dontBuild = true;
    dontFixup = true;

    inherit (fixupPackageJson) pnpmPatch;
    postPatch = fixupPackageJson.patch;

    installPhase = ''
      export HOME=$(mktemp -d)

      pnpm config set store-dir $out
      pnpm install --frozen-lockfile --ignore-script

      rm -rf $out/v3/tmp
      for f in $(find $out -name "*.json"); do
        sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
        jq --sort-keys . $f | sponge $f
      done
    '';

    outputHashMode = "recursive";
    outputHash = hash;
  } // builtins.removeAttrs args [ "pname" "hash" ]);
in stdenv.mkDerivation (final: {
  pname = "ferdium";
  version = "6.7.4";

  src = fetchFromGitHub {
    owner = "ferdium";
    repo = "ferdium-app";
    rev = "v${final.version}";
    hash = "sha256-ZYtXLMwAR4R6WbFhecUu1z7ThcFrcQDtbcccHyH9fXs=";
  };

  pnpmDeps = mkPnpmDeps {
    inherit (final) pname version src;
    hash = "sha256-4bTezNl6EOwL6A0RUq5H+ivrk2zczyoS4eoO3KVnEO0=";
  };

  recipes = stdenv.mkDerivation (recipesFinal: {
    pname = "${final.pname}-recipes";
    inherit (final) version;

    src = fetchFromGitHub {
      owner = "ferdium";
      repo = "ferdium-recipes";
      rev = "ae724d09560576253952f8884497a8d797215ae1";
      hash = "sha256-nbvEnDEsy66t0o37NkDIP8WkzYPAChQwout+BAKNG5I=";
    };

    pnpmDeps = mkPnpmDeps {
      inherit (recipesFinal) pname version src;
      hash = "sha256-atEfRhrfJ+aWFgJMetcJzw0JwTdJJBFkS/GEplEuNAM=";
    };

    inherit (fixupPackageJson) pnpmPatch;
    postPatch = fixupPackageJson.patch;

    nativeBuildInputs = [
      jq
      nodePackages.pnpm
      nodePackages.nodejs
      gitMinimal
    ];

    preBuild = ''
      export HOME=$(mktemp -d)
      export STORE_PATH=$(mktemp -d)

      cp -Tr "$pnpmDeps" "$STORE_PATH"
      chmod -R +w "$STORE_PATH"

      pnpm config set store-dir "$STORE_PATH"
      pnpm install --offline --frozen-lockfile --ignore-script
      patchShebangs node_modules/{*,.*}
    '';

    postBuild = ''
      pnpm run package
    '';

    installPhase = ''
      runHook preInstall

      mkdir $out
      cp -T all.json $out/all.json
      cp -Tr archives $out/archives

      runHook postInstall
    '';
  });

  nativeBuildInputs = [
    nodePackages.pnpm
    nodePackages.nodejs
    makeWrapper
    jq
    wrapGAppsHook
  ];

  dontPatchShebangs = true;
  dontPatchELF = true;

  inherit (fixupPackageJson) pnpmPatch;
  postPatch = ''
    cat > src/electron/ipc-api/dnd.ts <<"EOF"
    import { ipcMain } from 'electron';
    export default async () => {
      ipcMain.handle('get-dnd', async () => {
        return false;
      });
    };
    EOF
  '' + fixupPackageJson.patch;

  preBuild = ''
    export HOME=$(mktemp -d)
    export STORE_PATH=$(mktemp -d)

    cp -Tr "$pnpmDeps" "$STORE_PATH"
    chmod -R +w "$STORE_PATH"

    pnpm config set store-dir "$STORE_PATH"
    pnpm install --offline --frozen-lockfile --ignore-script
    patchShebangs node_modules/{*,.*}

    cp -Tr "$recipes" recipes
  '';

  postBuild = ''
    pnpm manage-translations
    node esbuild.mjs

    cp -Tr node_modules build/node_modules
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share

    cp -Tr build $out/share/ferdium
    cp -Tr node_modules $out/share/ferdium/node_modules

    makeWrapper ${electron}/bin/electron $out/bin/ferdium \
      --set ELECTRON_IS_DEV 0 \
      --add-flags $out/share/ferdium

    ln -s "${final.desktopItem}/share/applications" $out/share/applications

    for _size in 16 24 32 48 64 96 128 256 512 1024; do
      install -Dm0644 "build-helpers/images/icons/''${_size}x''${_size}.png" \
        "$out/share/icons/hicolor/''${_size}x''${_size}/apps/ferdium.png"
    done

    runHook postInstall
  '';

  desktopItem = makeDesktopItem {
    name = "ferdium";
    exec = "ferdium %U";
    icon = "ferdium";
    desktopName = "Ferdium";
    startupWMClass = "Ferdium";
    terminal = false;
    comment = final.meta.description;
    categories = [ "Network" "InstantMessaging" ];
  };

  meta = {
    description = "All your services in one place built by the community";
    homepage = "https://ferdium.org/";
    license = lib.licenses.asl20;
    platforms = electron.meta.platforms;
    mainProgram = "ferdium";
  };
})
