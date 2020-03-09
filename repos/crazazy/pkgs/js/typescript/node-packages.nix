# This file has been generated by node2nix 1.7.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
  args = {
    name = "typescript";
    packageName = "typescript";
    version = "3.8.3";
    src = fetchurl { url = "https://registry.npmjs.org/typescript/-/typescript-3.8.3.tgz"; sha1 = "409eb8544ea0335711205869ec458ab109ee1061"; };
    buildInputs = globalBuildInputs;
    meta = {
      description = "TypeScript is a language for application scale JavaScript development";
      homepage = https://www.typescriptlang.org/;
      license = "Apache-2.0";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}