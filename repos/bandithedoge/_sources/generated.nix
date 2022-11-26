# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}: {
  bling = {
    pname = "bling";
    version = "e6de047ced41051236a390b081105f598cb0ad8b";
    src = fetchFromGitHub {
      owner = "blingcorp";
      repo = "bling";
      rev = "e6de047ced41051236a390b081105f598cb0ad8b";
      fetchSubmodules = false;
      sha256 = "sha256-ehFUAhLUEOfqB/2Dung7fBPTCvuXepZB6oVLUv+rkTk=";
    };
    date = "2022-11-20";
  };
  cardinal = {
    pname = "cardinal";
    version = "a182b1216ef7deda52af83836d75ea8aa5e31b84";
    src = fetchFromGitHub {
      owner = "DISTRHO";
      repo = "Cardinal";
      rev = "a182b1216ef7deda52af83836d75ea8aa5e31b84";
      fetchSubmodules = true;
      sha256 = "sha256-OIojUS6wMrtTVulWRkBQhKwAAdM7arupJd2slsXA7Kw=";
    };
    date = "2022-11-26";
  };
  carla = {
    pname = "carla";
    version = "aa400535b31c67f4b6c1b28e6e20e4d4f82111a3";
    src = fetchFromGitHub {
      owner = "falkTX";
      repo = "Carla";
      rev = "aa400535b31c67f4b6c1b28e6e20e4d4f82111a3";
      fetchSubmodules = false;
      sha256 = "sha256-Vi7oWcbU1+/joDdqgww5djhOgmAwVte4gcUBk58W0jI=";
    };
    date = "2022-11-25";
  };
  dmenu-flexipatch = {
    pname = "dmenu-flexipatch";
    version = "05f5efc5e544fdb8e7744eb79a6a5d6f882b4d4c";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dmenu-flexipatch";
      rev = "05f5efc5e544fdb8e7744eb79a6a5d6f882b4d4c";
      fetchSubmodules = false;
      sha256 = "sha256-6hGunum5+IBSpxJPvEOAgNmCkDNbm3R++RSTg8TL8Vo=";
    };
    date = "2022-10-26";
  };
  dwm-flexipatch = {
    pname = "dwm-flexipatch";
    version = "dc4e535b253dcb38605443508d17cda2d8323d01";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "dwm-flexipatch";
      rev = "dc4e535b253dcb38605443508d17cda2d8323d01";
      fetchSubmodules = false;
      sha256 = "sha256-JrhRjNOlxducXE/Ra7yMUgEJmIHgveA7NGhRWoKYGRQ=";
    };
    date = "2022-11-15";
  };
  keepmenu = {
    pname = "keepmenu";
    version = "1.3.1";
    src = fetchFromGitHub {
      owner = "firecat53";
      repo = "keepmenu";
      rev = "1.3.1";
      fetchSubmodules = false;
      sha256 = "sha256-1s+vl5j0oPERUvJCKFTvLubCF8Nhx7OtkPjpWmpEG/o=";
    };
  };
  kiwmi = {
    pname = "kiwmi";
    version = "17814972abe6a8811a586fa87c99a2b16a86075f";
    src = fetchFromGitHub {
      owner = "buffet";
      repo = "kiwmi";
      rev = "17814972abe6a8811a586fa87c99a2b16a86075f";
      fetchSubmodules = false;
      sha256 = "sha256-n9PA6cyEjSlnDcRrqIkO83UaCE/hovbi/oZon1B+nuw=";
    };
    date = "2022-07-30";
  };
  lua-dbus = {
    pname = "lua-dbus";
    version = "cdef26d09aa61d7f1f175675040383f6ae0becbb";
    src = fetchFromGitHub {
      owner = "dodo";
      repo = "lua-dbus";
      rev = "cdef26d09aa61d7f1f175675040383f6ae0becbb";
      fetchSubmodules = false;
      sha256 = "sha256-S+W6QTqv4kdyR86GCyDLnkml10dO4ZVNXEd3/7vDFGE=";
    };
    date = "2015-04-22";
  };
  lua-dbus_proxy = {
    pname = "lua-dbus_proxy";
    version = "v0.10.3";
    src = fetchFromGitHub {
      owner = "stefano-m";
      repo = "lua-dbus_proxy";
      rev = "v0.10.3";
      fetchSubmodules = false;
      sha256 = "sha256-Yd8TN/vKiqX7NOZyy8OwOnreWS5gdyVMTAjFqoAuces=";
    };
  };
  luakit = {
    pname = "luakit";
    version = "68e4ffc74ce2381f09e242d95bf03d0a4f1cc95e";
    src = fetchFromGitHub {
      owner = "luakit";
      repo = "luakit";
      rev = "68e4ffc74ce2381f09e242d95bf03d0a4f1cc95e";
      fetchSubmodules = false;
      sha256 = "sha256-DtoixcLq+ddbacTAo+Qq6q4k1i6thirACw1zqUeOxXo=";
    };
    date = "2022-11-09";
  };
  lv2vst = {
    pname = "lv2vst";
    version = "30a669a021812da05258519cef9d4202f5ce26c3";
    src = fetchFromGitHub {
      owner = "x42";
      repo = "lv2vst";
      rev = "30a669a021812da05258519cef9d4202f5ce26c3";
      fetchSubmodules = false;
      sha256 = "sha256-WFVscNivFrsADl7w5pSYx9g+UzK2XUBF7x0Iqg8WKiQ=";
    };
    date = "2020-06-07";
  };
  raze = {
    pname = "raze";
    version = "1.5.0";
    src = fetchFromGitHub {
      owner = "ZDoom";
      repo = "Raze";
      rev = "1.5.0";
      fetchSubmodules = false;
      sha256 = "sha256-b7RFC90v5Kj2rTWdil2A8OLF6wicA08X87uS6nb4l5c=";
    };
  };
  slock-flexipatch = {
    pname = "slock-flexipatch";
    version = "780a7887a3b976a48786f991d55fc8a474e76a25";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "slock-flexipatch";
      rev = "780a7887a3b976a48786f991d55fc8a474e76a25";
      fetchSubmodules = false;
      sha256 = "sha256-3jzEXIaH6qZkbvumlYqPSW1kDjg8obDMVoj6y3Vhe4I=";
    };
    date = "2022-10-06";
  };
  st-flexipatch = {
    pname = "st-flexipatch";
    version = "e6a2fb489c192e2cd9439691014f48779d4966ad";
    src = fetchFromGitHub {
      owner = "bakkeby";
      repo = "st-flexipatch";
      rev = "e6a2fb489c192e2cd9439691014f48779d4966ad";
      fetchSubmodules = false;
      sha256 = "sha256-DCsuRbJJbU2Ii4vnOyd1o21VqiXvo2Dz7PKOsDizvCc=";
    };
    date = "2022-10-25";
  };
  taffybar = {
    pname = "taffybar";
    version = "78d2609b28fe1ee8098ee4756d048ff9e0369158";
    src = fetchFromGitHub {
      owner = "taffybar";
      repo = "taffybar";
      rev = "78d2609b28fe1ee8098ee4756d048ff9e0369158";
      fetchSubmodules = false;
      sha256 = "sha256-G5pert+GvpU33GNfdBa8T+z+u7r7WCW+Cr9z2lUBtbQ=";
    };
    date = "2022-11-18";
  };
  tailwindcss-intellisense = {
    pname = "tailwindcss-intellisense";
    version = "6b3e598e5378812b42db8a208db4980c82b60a10";
    src = fetchFromGitHub {
      owner = "tailwindlabs";
      repo = "tailwindcss-intellisense";
      rev = "6b3e598e5378812b42db8a208db4980c82b60a10";
      fetchSubmodules = false;
      sha256 = "sha256-CfeGATXOfpzw/tjjZm2bmawyArCHIjd3/WnIyFR8vP4=";
    };
    date = "2022-11-11";
  };
  xmonad-entryhelper = {
    pname = "xmonad-entryhelper";
    version = "ee2d0c14f9258503d7bd62907aa731dd64fa34d0";
    src = fetchFromGitHub {
      owner = "Javran";
      repo = "xmonad-entryhelper";
      rev = "ee2d0c14f9258503d7bd62907aa731dd64fa34d0";
      fetchSubmodules = false;
      sha256 = "sha256-CGaibR0Yejng9IQInm92Zx0pEZS29tJjWvPgaiWgUNQ=";
    };
    date = "2022-05-18";
  };
  zix = {
    pname = "zix";
    version = "577356481bbcb12468bcf669ef7107dfb057b833";
    src = fetchFromGitHub {
      owner = "drobilla";
      repo = "zix";
      rev = "577356481bbcb12468bcf669ef7107dfb057b833";
      fetchSubmodules = false;
      sha256 = "sha256-1HJgbcQ5WMpUJ574LsubX+/gtUv4hUbyHW4AVVjdGGs=";
    };
    date = "2022-11-25";
  };
  zmusic = {
    pname = "zmusic";
    version = "1.1.3";
    src = fetchFromGitHub {
      owner = "ZDoom";
      repo = "ZMusic";
      rev = "1.1.3";
      fetchSubmodules = false;
      sha256 = "sha256-wrNWfTIbNU/S2qFObUSkb6qyaceh+Y7Loxqudl86+W4=";
    };
  };
  zrythm = {
    pname = "zrythm";
    version = "ac18b010720b6a25d443acac7cd25be869d6b7b8";
    src = fetchgit {
      url = "https://git.sr.ht/~alextee/zrythm";
      rev = "ac18b010720b6a25d443acac7cd25be869d6b7b8";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-2CMEawyffJ6+0g3lyhQwFQGmEO02PTDkjTcMU5Raxic=";
    };
    date = "2022-11-26";
  };
}
