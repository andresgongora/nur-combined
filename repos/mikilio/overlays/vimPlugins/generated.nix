# GENERATED by ./pkgs/applications/editors/vim/plugins/update.py. Do not edit!
{ lib, buildVimPluginFrom2Nix, buildNeovimPlugin, fetchFromGitHub, fetchgit }:

final: prev:
{
  knap = buildVimPluginFrom2Nix {
    pname = "knap";
    version = "2023-08-05";
    src = fetchFromGitHub {
      owner = "Mikilio";
      repo = "knap";
      rev = "1f40245d762f674a559465489831c1e284eab65e";
      sha256 = "13zxih9xnr66b4jlqki43mc6rhmn0c554xaqvvh1bjzvxfgml6fl";
    };
    meta.homepage = "https://github.com/Mikilio/knap/";
  };

  texmagic-nvim = buildVimPluginFrom2Nix {
    pname = "texmagic.nvim";
    version = "2022-05-15";
    src = fetchFromGitHub {
      owner = "jakewvincent";
      repo = "texmagic.nvim";
      rev = "3c0d3b63c62486f02807663f5c5948e8b237b182";
      sha256 = "19r6sdyaxkjmm9k5l97n4fcp5ycx8d3v9kyydxzcpxji5synv2gq";
    };
    meta.homepage = "https://github.com/jakewvincent/texmagic.nvim/";
  };


}
