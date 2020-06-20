# This file has been generated by node2nix 1.8.0. Do not edit!

{ nodeEnv, fetchurl, fetchgit, globalBuildInputs ? [ ] }:
let
  sources = { };
  args = {
    name = "rollup";
    packageName = "rollup";
    version = "2.16.0";
    src = fetchurl { url = "https://registry.npmjs.org/rollup/-/rollup-2.16.0.tgz"; sha1 = "f45ed04a2cafdb4d1b71a2a77b5673334d811a32"; };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Next-generation ES module bundler";
      homepage = https://rollupjs.org/;
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}
