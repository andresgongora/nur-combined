# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  expect-language-server = {
    pname = "expect-language-server";
    version = "0.0.1";
    src = fetchurl {
      url = "https://pypi.org/packages/source/e/expect-language-server/expect-language-server-0.0.1.tar.gz";
      sha256 = "sha256-7L2h91ZpB+VhUlP5kOa4lpKzr8LnkjXcP8I45M9Lrgk=";
    };
  };
  g3kb-switch = {
    pname = "g3kb-switch";
    version = "1.4";
    src = fetchFromGitHub {
      owner = "lyokha";
      repo = "g3kb-switch";
      rev = "1.4";
      fetchSubmodules = false;
      sha256 = "sha256-mcZduHcteZ+nS0YEZG5DfmpA8xrnLhwxumq6hLuLPIs=";
    };
  };
  manpager = {
    pname = "manpager";
    version = "0.0.2";
    src = fetchFromGitHub {
      owner = "Freed-Wu";
      repo = "manpager";
      rev = "0.0.2";
      fetchSubmodules = false;
      sha256 = "sha256-DzFH/K03JZRursmGFiLEuWWOmK3tv2NghkJIpKVcwUk=";
    };
  };
  mulimgviewer = {
    pname = "mulimgviewer";
    version = "3.9.10";
    src = fetchurl {
      url = "https://pypi.org/packages/source/m/mulimgviewer/mulimgviewer-3.9.10.tar.gz";
      sha256 = "sha256-srBgon7/yrbvV6m0Em67iiA1KLo6b2QTJjN786bZIck=";
    };
  };
  mutt-language-server = {
    pname = "mutt-language-server";
    version = "0.0.4";
    src = fetchurl {
      url = "https://pypi.org/packages/source/m/mutt-language-server/mutt-language-server-0.0.4.tar.gz";
      sha256 = "sha256-zqv3fhSiO/h0TyV8faFZKx6dHjGQ3UzuUxPE8JXwnew=";
    };
  };
  repl-python-wakatime = {
    pname = "repl-python-wakatime";
    version = "0.0.10";
    src = fetchurl {
      url = "https://pypi.org/packages/source/r/repl-python-wakatime/repl-python-wakatime-0.0.10.tar.gz";
      sha256 = "sha256-bNJ6ZN3JWuwQ7CYRgEPtFG59GFiYJJ9Sb3QlxyhB/FE=";
    };
  };
  requirements-language-server = {
    pname = "requirements-language-server";
    version = "0.0.14";
    src = fetchurl {
      url = "https://pypi.org/packages/source/r/requirements-language-server/requirements-language-server-0.0.14.tar.gz";
      sha256 = "sha256-aRdw2/cbIL0r+Wyy+K6tqMY6m35TvurEHtkclhYwa1E=";
    };
  };
  sublime-syntax-language-server = {
    pname = "sublime-syntax-language-server";
    version = "0.0.4";
    src = fetchurl {
      url = "https://pypi.org/packages/source/s/sublime-syntax-language-server/sublime-syntax-language-server-0.0.4.tar.gz";
      sha256 = "sha256-bC3gVsjJMccA5vxdwV6/DNTn81+RCAprjLgBMQAjyzs=";
    };
  };
  termux-language-server = {
    pname = "termux-language-server";
    version = "0.0.18";
    src = fetchurl {
      url = "https://pypi.org/packages/source/t/termux-language-server/termux-language-server-0.0.18.tar.gz";
      sha256 = "sha256-+kUDOIKTPVNOXhRGsmJZghwvVHJB/BGu4SQQRahbCLQ=";
    };
  };
  tmux-language-server = {
    pname = "tmux-language-server";
    version = "0.0.2";
    src = fetchurl {
      url = "https://pypi.org/packages/source/t/tmux-language-server/tmux-language-server-0.0.2.tar.gz";
      sha256 = "sha256-TKnQ2nQMSRj62HTo8rjPvUYatyQuG2R2N49a03UCDBI=";
    };
  };
  translate-shell = {
    pname = "translate-shell";
    version = "0.0.51";
    src = fetchurl {
      url = "https://pypi.org/packages/source/t/translate-shell/translate-shell-0.0.51.tar.gz";
      sha256 = "sha256-CrqcfyUH1EvagfoRUEMOdosK53nnQo56R6/hyX+ee7o=";
    };
  };
  undollar = {
    pname = "undollar";
    version = "0.0.5";
    src = fetchFromGitHub {
      owner = "Freed-Wu";
      repo = "undollar";
      rev = "0.0.5";
      fetchSubmodules = false;
      sha256 = "sha256-HyWZz7wYnKDID8zs/a96YByjoPO7vKRAPZg6rL17sQ4=";
    };
  };
  xilinx-language-server = {
    pname = "xilinx-language-server";
    version = "0.0.4";
    src = fetchurl {
      url = "https://pypi.org/packages/source/x/xilinx-language-server/xilinx-language-server-0.0.4.tar.gz";
      sha256 = "sha256-Qs2/RO4i0WHm4dmZh6iHmCLGkgTPLIBErc1n8YRvuk8=";
    };
  };
  zathura-language-server = {
    pname = "zathura-language-server";
    version = "0.0.6";
    src = fetchurl {
      url = "https://pypi.org/packages/source/z/zathura-language-server/zathura-language-server-0.0.6.tar.gz";
      sha256 = "sha256-px0P3h7RYkHZVFoMWRdHbqI/z1knsUnVqVa3mUhUH+Q=";
    };
  };
}
