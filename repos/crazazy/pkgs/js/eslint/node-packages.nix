# This file has been generated by node2nix 1.8.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "@babel/code-frame-7.10.4" = {
      name = "_at_babel_slash_code-frame";
      packageName = "@babel/code-frame";
      version = "7.10.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.10.4.tgz";
        sha512 = "vG6SvB6oYEhvgisZNFRmRCUkLz11c7rp+tbNTynGqc6mS1d5ATd/sGyV6W0KZZnXRKMTzZDRgQT3Ou9jhpAfUg==";
      };
    };
    "@babel/helper-validator-identifier-7.10.4" = {
      name = "_at_babel_slash_helper-validator-identifier";
      packageName = "@babel/helper-validator-identifier";
      version = "7.10.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.10.4.tgz";
        sha512 = "3U9y+43hz7ZM+rzG24Qe2mufW5KhvFg/NhnNph+i9mgCtdTCtMJuI1TMkrIUiK7Ix4PYlRF9I5dhqaLYA/ADXw==";
      };
    };
    "@babel/highlight-7.10.4" = {
      name = "_at_babel_slash_highlight";
      packageName = "@babel/highlight";
      version = "7.10.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@babel/highlight/-/highlight-7.10.4.tgz";
        sha512 = "i6rgnR/YgPEQzZZnbTHHuZdlE8qyoBNalD6F+q4vAFlcMEcqmkoG+mPqJYJCo63qPf74+Y1UZsl3l6f7/RIkmA==";
      };
    };
    "@types/color-name-1.1.1" = {
      name = "_at_types_slash_color-name";
      packageName = "@types/color-name";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/color-name/-/color-name-1.1.1.tgz";
        sha512 = "rr+OQyAjxze7GgWrSaJwydHStIhHq2lvY3BOC2Mj7KnzI7XK0Uw1TOOdI9lDoajEbSWLiYgoo4f1R51erQfhPQ==";
      };
    };
    "acorn-7.4.0" = {
      name = "acorn";
      packageName = "acorn";
      version = "7.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn/-/acorn-7.4.0.tgz";
        sha512 = "+G7P8jJmCHr+S+cLfQxygbWhXy+8YTVGzAkpEbcLo2mLoL7tij/VG41QSHACSf5QgYRhMZYHuNc6drJaO0Da+w==";
      };
    };
    "acorn-jsx-5.2.0" = {
      name = "acorn-jsx";
      packageName = "acorn-jsx";
      version = "5.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn-jsx/-/acorn-jsx-5.2.0.tgz";
        sha512 = "HiUX/+K2YpkpJ+SzBffkM/AQ2YE03S0U1kjTLVpoJdhZMOWy8qvXVN9JdLqv2QsaQ6MPYQIuNmwD8zOiYUofLQ==";
      };
    };
    "ajv-6.12.4" = {
      name = "ajv";
      packageName = "ajv";
      version = "6.12.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/ajv/-/ajv-6.12.4.tgz";
        sha512 = "eienB2c9qVQs2KWexhkrdMLVDoIQCz5KSeLxwg9Lzk4DOfBtIK9PQwwufcsn1jjGuf9WZmqPMbGxOzfcuphJCQ==";
      };
    };
    "ansi-colors-4.1.1" = {
      name = "ansi-colors";
      packageName = "ansi-colors";
      version = "4.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-colors/-/ansi-colors-4.1.1.tgz";
        sha512 = "JoX0apGbHaUJBNl6yF+p6JAFYZ666/hhCGKN5t9QFjbJQKUU/g8MNbFDbvfrgKXvI1QpZplPOnwIo99lX/AAmA==";
      };
    };
    "ansi-regex-4.1.0" = {
      name = "ansi-regex";
      packageName = "ansi-regex";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-4.1.0.tgz";
        sha512 = "1apePfXM1UOSqw0o9IiFAovVz9M5S1Dg+4TrDwfMewQ6p/rmMueb7tWZjQ1rx4Loy1ArBggoqGpfqqdI4rondg==";
      };
    };
    "ansi-regex-5.0.0" = {
      name = "ansi-regex";
      packageName = "ansi-regex";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.0.tgz";
        sha512 = "bY6fj56OUQ0hU1KjFNDQuJFezqKdrAyFdIevADiqrWHwSlbmBNMHp5ak2f40Pm8JTFyM2mqxkG6ngkHO11f/lg==";
      };
    };
    "ansi-styles-3.2.1" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "3.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz";
        sha512 = "VT0ZI6kZRdTh8YyJw3SMbYm/u+NqfsAxEpWO0Pf9sq8/e94WxxOpPKx9FR1FlyCtOVDNOQ+8ntlqFxiRc+r5qA==";
      };
    };
    "ansi-styles-4.2.1" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "4.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.2.1.tgz";
        sha512 = "9VGjrMsG1vePxcSweQsN20KY/c4zN0h9fLjqAbwbPfahM3t+NL+M9HC8xeXG2I8pX5NoamTGNuomEUFI7fcUjA==";
      };
    };
    "argparse-1.0.10" = {
      name = "argparse";
      packageName = "argparse";
      version = "1.0.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz";
        sha512 = "o5Roy6tNG4SL/FOkCAN6RzjiakZS25RLYFrcMttJqbdd8BWrnA+fGz57iN5Pb06pvBGvl5gQ0B48dJlslXvoTg==";
      };
    };
    "astral-regex-1.0.0" = {
      name = "astral-regex";
      packageName = "astral-regex";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/astral-regex/-/astral-regex-1.0.0.tgz";
        sha512 = "+Ryf6g3BKoRc7jfp7ad8tM4TtMiaWvbF/1/sQcZPkkS7ag3D5nMBCe2UfOTONtAkaG0tO0ij3C5Lwmf1EiyjHg==";
      };
    };
    "balanced-match-1.0.0" = {
      name = "balanced-match";
      packageName = "balanced-match";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz";
        sha1 = "89b4d199ab2bee49de164ea02b89ce462d71b767";
      };
    };
    "brace-expansion-1.1.11" = {
      name = "brace-expansion";
      packageName = "brace-expansion";
      version = "1.1.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
        sha512 = "iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==";
      };
    };
    "callsites-3.1.0" = {
      name = "callsites";
      packageName = "callsites";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz";
        sha512 = "P8BjAsXvZS+VIDUI11hHCQEv74YT67YUi5JJFNWIqL235sBmjX4+qx9Muvls5ivyNENctx46xQLQ3aTuE7ssaQ==";
      };
    };
    "chalk-2.4.2" = {
      name = "chalk";
      packageName = "chalk";
      version = "2.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz";
        sha512 = "Mti+f9lpJNcwF4tWV8/OrTTtF1gZi+f8FqlyAdouralcFWFQWF2+NgCHShjkCb+IFBLq9buZwE1xckQU4peSuQ==";
      };
    };
    "chalk-4.1.0" = {
      name = "chalk";
      packageName = "chalk";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/chalk/-/chalk-4.1.0.tgz";
        sha512 = "qwx12AxXe2Q5xQ43Ac//I6v5aXTipYrSESdOgzrN+9XjgEpyjpKuvSGaN4qE93f7TQTlerQQ8S+EQ0EyDoVL1A==";
      };
    };
    "color-convert-1.9.3" = {
      name = "color-convert";
      packageName = "color-convert";
      version = "1.9.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz";
        sha512 = "QfAUtd+vFdAtFQcC8CCyYt1fYWxSqAiK2cSD6zDB8N3cpsEBAvRxp9zOGg6G/SHHJYAT88/az/IuDGALsNVbGg==";
      };
    };
    "color-convert-2.0.1" = {
      name = "color-convert";
      packageName = "color-convert";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
        sha512 = "RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==";
      };
    };
    "color-name-1.1.3" = {
      name = "color-name";
      packageName = "color-name";
      version = "1.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz";
        sha1 = "a7d0558bd89c42f795dd42328f740831ca53bc25";
      };
    };
    "color-name-1.1.4" = {
      name = "color-name";
      packageName = "color-name";
      version = "1.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
        sha512 = "dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA==";
      };
    };
    "concat-map-0.0.1" = {
      name = "concat-map";
      packageName = "concat-map";
      version = "0.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
        sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
      };
    };
    "cross-spawn-7.0.3" = {
      name = "cross-spawn";
      packageName = "cross-spawn";
      version = "7.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz";
        sha512 = "iRDPJKUPVEND7dHPO8rkbOnPpyDygcDFtWjpeWNCgy8WP2rXcxXL8TskReQl6OrB2G7+UJrags1q15Fudc7G6w==";
      };
    };
    "debug-4.2.0" = {
      name = "debug";
      packageName = "debug";
      version = "4.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-4.2.0.tgz";
        sha512 = "IX2ncY78vDTjZMFUdmsvIRFY2Cf4FnD0wRs+nQwJU8Lu99/tPFdb0VybiiMTPe3I6rQmwsqQqRBvxU+bZ/I8sg==";
      };
    };
    "deep-is-0.1.3" = {
      name = "deep-is";
      packageName = "deep-is";
      version = "0.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/deep-is/-/deep-is-0.1.3.tgz";
        sha1 = "b369d6fb5dbc13eecf524f91b070feedc357cf34";
      };
    };
    "doctrine-3.0.0" = {
      name = "doctrine";
      packageName = "doctrine";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/doctrine/-/doctrine-3.0.0.tgz";
        sha512 = "yS+Q5i3hBf7GBkd4KG8a7eBNNWNGLTaEwwYWUijIYM7zrlYDM0BFXHjjPWlWZ1Rg7UaddZeIDmi9jF3HmqiQ2w==";
      };
    };
    "emoji-regex-7.0.3" = {
      name = "emoji-regex";
      packageName = "emoji-regex";
      version = "7.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/emoji-regex/-/emoji-regex-7.0.3.tgz";
        sha512 = "CwBLREIQ7LvYFB0WyRvwhq5N5qPhc6PMjD6bYggFlI5YyDgl+0vxq5VHbMOFqLg7hfWzmu8T5Z1QofhmTIhItA==";
      };
    };
    "enquirer-2.3.6" = {
      name = "enquirer";
      packageName = "enquirer";
      version = "2.3.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/enquirer/-/enquirer-2.3.6.tgz";
        sha512 = "yjNnPr315/FjS4zIsUxYguYUPP2e1NK4d7E7ZOLiyYCcbFBiTMyID+2wvm2w6+pZ/odMA7cRkjhsPbltwBOrLg==";
      };
    };
    "escape-string-regexp-1.0.5" = {
      name = "escape-string-regexp";
      packageName = "escape-string-regexp";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
        sha1 = "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4";
      };
    };
    "eslint-scope-5.1.0" = {
      name = "eslint-scope";
      packageName = "eslint-scope";
      version = "5.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/eslint-scope/-/eslint-scope-5.1.0.tgz";
        sha512 = "iiGRvtxWqgtx5m8EyQUJihBloE4EnYeGE/bz1wSPwJE6tZuJUtHlhqDM4Xj2ukE8Dyy1+HCZ4hE0fzIVMzb58w==";
      };
    };
    "eslint-utils-2.1.0" = {
      name = "eslint-utils";
      packageName = "eslint-utils";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/eslint-utils/-/eslint-utils-2.1.0.tgz";
        sha512 = "w94dQYoauyvlDc43XnGB8lU3Zt713vNChgt4EWwhXAP2XkBvndfxF0AgIqKOOasjPIPzj9JqgwkwbCYD0/V3Zg==";
      };
    };
    "eslint-visitor-keys-1.3.0" = {
      name = "eslint-visitor-keys";
      packageName = "eslint-visitor-keys";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-1.3.0.tgz";
        sha512 = "6J72N8UNa462wa/KFODt/PJ3IU60SDpC3QXC1Hjc1BXXpfL2C9R5+AU7jhe0F6GREqVMh4Juu+NY7xn+6dipUQ==";
      };
    };
    "espree-7.2.0" = {
      name = "espree";
      packageName = "espree";
      version = "7.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/espree/-/espree-7.2.0.tgz";
        sha512 = "H+cQ3+3JYRMEIOl87e7QdHX70ocly5iW4+dttuR8iYSPr/hXKFb+7dBsZ7+u1adC4VrnPlTkv0+OwuPnDop19g==";
      };
    };
    "esprima-4.0.1" = {
      name = "esprima";
      packageName = "esprima";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz";
        sha512 = "eGuFFw7Upda+g4p+QHvnW0RyTX/SVeJBDM/gCtMARO0cLuT2HcEKnTPvhjV6aGeqrCB/sbNop0Kszm0jsaWU4A==";
      };
    };
    "esquery-1.3.1" = {
      name = "esquery";
      packageName = "esquery";
      version = "1.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/esquery/-/esquery-1.3.1.tgz";
        sha512 = "olpvt9QG0vniUBZspVRN6lwB7hOZoTRtT+jzR+tS4ffYx2mzbw+z0XCOk44aaLYKApNX5nMm+E+P6o25ip/DHQ==";
      };
    };
    "esrecurse-4.2.1" = {
      name = "esrecurse";
      packageName = "esrecurse";
      version = "4.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/esrecurse/-/esrecurse-4.2.1.tgz";
        sha512 = "64RBB++fIOAXPw3P9cy89qfMlvZEXZkqqJkjqqXIvzP5ezRZjW+lPWjw35UX/3EhUPFYbg5ER4JYgDw4007/DQ==";
      };
    };
    "estraverse-4.3.0" = {
      name = "estraverse";
      packageName = "estraverse";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/estraverse/-/estraverse-4.3.0.tgz";
        sha512 = "39nnKffWz8xN1BU/2c79n9nB9HDzo0niYUqx6xyqUnyoAnQyyWpOTdZEeiCch8BBu515t4wp9ZmgVfVhn9EBpw==";
      };
    };
    "estraverse-5.2.0" = {
      name = "estraverse";
      packageName = "estraverse";
      version = "5.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/estraverse/-/estraverse-5.2.0.tgz";
        sha512 = "BxbNGGNm0RyRYvUdHpIwv9IWzeM9XClbOxwoATuFdOE7ZE6wHL+HQ5T8hoPM+zHvmKzzsEqhgy0GrQ5X13afiQ==";
      };
    };
    "esutils-2.0.3" = {
      name = "esutils";
      packageName = "esutils";
      version = "2.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz";
        sha512 = "kVscqXk4OCp68SZ0dkgEKVi6/8ij300KBWTJq32P/dYeWTSwK41WyTxalN1eRmA5Z9UU/LX9D7FWSmV9SAYx6g==";
      };
    };
    "fast-deep-equal-3.1.3" = {
      name = "fast-deep-equal";
      packageName = "fast-deep-equal";
      version = "3.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz";
        sha512 = "f3qQ9oQy9j2AhBe/H9VC91wLmKBCCU/gDOnKNAYG5hswO7BLKj09Hc5HYNz9cGI++xlpDCIgDaitVs03ATR84Q==";
      };
    };
    "fast-json-stable-stringify-2.1.0" = {
      name = "fast-json-stable-stringify";
      packageName = "fast-json-stable-stringify";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz";
        sha512 = "lhd/wF+Lk98HZoTCtlVraHtfh5XYijIjalXck7saUtuanSDyLMxnHhSXEDJqHxD7msR8D0uCmqlkwjCV8xvwHw==";
      };
    };
    "fast-levenshtein-2.0.6" = {
      name = "fast-levenshtein";
      packageName = "fast-levenshtein";
      version = "2.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz";
        sha1 = "3d8a5c66883a16a30ca8643e851f19baa7797917";
      };
    };
    "file-entry-cache-5.0.1" = {
      name = "file-entry-cache";
      packageName = "file-entry-cache";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/file-entry-cache/-/file-entry-cache-5.0.1.tgz";
        sha512 = "bCg29ictuBaKUwwArK4ouCaqDgLZcysCFLmM/Yn/FDoqndh/9vNuQfXRDvTuXKLxfD/JtZQGKFT8MGcJBK644g==";
      };
    };
    "flat-cache-2.0.1" = {
      name = "flat-cache";
      packageName = "flat-cache";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/flat-cache/-/flat-cache-2.0.1.tgz";
        sha512 = "LoQe6yDuUMDzQAEH8sgmh4Md6oZnc/7PjtwjNFSzveXqSHt6ka9fPBuso7IGf9Rz4uqnSnWiFH2B/zj24a5ReA==";
      };
    };
    "flatted-2.0.2" = {
      name = "flatted";
      packageName = "flatted";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/flatted/-/flatted-2.0.2.tgz";
        sha512 = "r5wGx7YeOwNWNlCA0wQ86zKyDLMQr+/RB8xy74M4hTphfmjlijTSSXGuH8rnvKZnfT9i+75zmd8jcKdMR4O6jA==";
      };
    };
    "fs.realpath-1.0.0" = {
      name = "fs.realpath";
      packageName = "fs.realpath";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
        sha1 = "1504ad2523158caa40db4a2787cb01411994ea4f";
      };
    };
    "functional-red-black-tree-1.0.1" = {
      name = "functional-red-black-tree";
      packageName = "functional-red-black-tree";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/functional-red-black-tree/-/functional-red-black-tree-1.0.1.tgz";
        sha1 = "1b0ab3bd553b2a0d6399d29c0e3ea0b252078327";
      };
    };
    "glob-7.1.6" = {
      name = "glob";
      packageName = "glob";
      version = "7.1.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob/-/glob-7.1.6.tgz";
        sha512 = "LwaxwyZ72Lk7vZINtNNrywX0ZuLyStrdDtabefZKAY5ZGJhVtgdznluResxNmPitE0SAO+O26sWTHeKSI2wMBA==";
      };
    };
    "glob-parent-5.1.1" = {
      name = "glob-parent";
      packageName = "glob-parent";
      version = "5.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.1.tgz";
        sha512 = "FnI+VGOpnlGHWZxthPGR+QhR78fuiK0sNLkHQv+bL9fQi57lNNdquIbna/WrfROrolq8GK5Ek6BiMwqL/voRYQ==";
      };
    };
    "globals-12.4.0" = {
      name = "globals";
      packageName = "globals";
      version = "12.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/globals/-/globals-12.4.0.tgz";
        sha512 = "BWICuzzDvDoH54NHKCseDanAhE3CeDorgDL5MT6LMXXj2WCnd9UC2szdk4AWLfjdgNBCXLUanXYcpBBKOSWGwg==";
      };
    };
    "has-flag-3.0.0" = {
      name = "has-flag";
      packageName = "has-flag";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz";
        sha1 = "b5d454dc2199ae225699f3467e5a07f3b955bafd";
      };
    };
    "has-flag-4.0.0" = {
      name = "has-flag";
      packageName = "has-flag";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz";
        sha512 = "EykJT/Q1KjTWctppgIAgfSO0tKVuZUjhgMr17kqTumMl6Afv3EISleU7qZUzoXDFTAHTDC4NOoG/ZxU3EvlMPQ==";
      };
    };
    "ignore-4.0.6" = {
      name = "ignore";
      packageName = "ignore";
      version = "4.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/ignore/-/ignore-4.0.6.tgz";
        sha512 = "cyFDKrqc/YdcWFniJhzI42+AzS+gNwmUzOSFcRCQYwySuBBBy/KjuxWLZ/FHEH6Moq1NizMOBWyTcv8O4OZIMg==";
      };
    };
    "import-fresh-3.2.1" = {
      name = "import-fresh";
      packageName = "import-fresh";
      version = "3.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/import-fresh/-/import-fresh-3.2.1.tgz";
        sha512 = "6e1q1cnWP2RXD9/keSkxHScg508CdXqXWgWBaETNhyuBFz+kUZlKboh+ISK+bU++DmbHimVBrOz/zzPe0sZ3sQ==";
      };
    };
    "imurmurhash-0.1.4" = {
      name = "imurmurhash";
      packageName = "imurmurhash";
      version = "0.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz";
        sha1 = "9218b9b2b928a238b13dc4fb6b6d576f231453ea";
      };
    };
    "inflight-1.0.6" = {
      name = "inflight";
      packageName = "inflight";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz";
        sha1 = "49bd6331d7d02d0c09bc910a1075ba8165b56df9";
      };
    };
    "inherits-2.0.4" = {
      name = "inherits";
      packageName = "inherits";
      version = "2.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz";
        sha512 = "k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==";
      };
    };
    "is-extglob-2.1.1" = {
      name = "is-extglob";
      packageName = "is-extglob";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz";
        sha1 = "a88c02535791f02ed37c76a1b9ea9773c833f8c2";
      };
    };
    "is-fullwidth-code-point-2.0.0" = {
      name = "is-fullwidth-code-point";
      packageName = "is-fullwidth-code-point";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz";
        sha1 = "a3b30a5c4f199183167aaab93beefae3ddfb654f";
      };
    };
    "is-glob-4.0.1" = {
      name = "is-glob";
      packageName = "is-glob";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-glob/-/is-glob-4.0.1.tgz";
        sha512 = "5G0tKtBTFImOqDnLB2hG6Bp2qcKEFduo4tZu9MT/H6NQv/ghhy30o55ufafxJ/LdH79LLs2Kfrn85TLKyA7BUg==";
      };
    };
    "isexe-2.0.0" = {
      name = "isexe";
      packageName = "isexe";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
        sha1 = "e8fbf374dc556ff8947a10dcb0572d633f2cfa10";
      };
    };
    "js-tokens-4.0.0" = {
      name = "js-tokens";
      packageName = "js-tokens";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz";
        sha512 = "RdJUflcE3cUzKiMqQgsCu06FPu9UdIJO0beYbPhHN4k6apgJtifcoCtT9bcxOpYBtpD2kCM6Sbzg4CausW/PKQ==";
      };
    };
    "js-yaml-3.14.0" = {
      name = "js-yaml";
      packageName = "js-yaml";
      version = "3.14.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/js-yaml/-/js-yaml-3.14.0.tgz";
        sha512 = "/4IbIeHcD9VMHFqDR/gQ7EdZdLimOvW2DdcxFjdyyZ9NsbS+ccrXqVWDtab/lRl5AlUqmpBx8EhPaWR+OtY17A==";
      };
    };
    "json-schema-traverse-0.4.1" = {
      name = "json-schema-traverse";
      packageName = "json-schema-traverse";
      version = "0.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz";
        sha512 = "xbbCH5dCYU5T8LcEhhuh7HJ88HXuW3qsI3Y0zOZFKfZEHcpWiHU/Jxzk629Brsab/mMiHQti9wMP+845RPe3Vg==";
      };
    };
    "json-stable-stringify-without-jsonify-1.0.1" = {
      name = "json-stable-stringify-without-jsonify";
      packageName = "json-stable-stringify-without-jsonify";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz";
        sha1 = "9db7b59496ad3f3cfef30a75142d2d930ad72651";
      };
    };
    "levn-0.4.1" = {
      name = "levn";
      packageName = "levn";
      version = "0.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/levn/-/levn-0.4.1.tgz";
        sha512 = "+bT2uH4E5LGE7h/n3evcS/sQlJXCpIp6ym8OWJ5eV6+67Dsql/LaaT7qJBAt2rzfoa/5QBGBhxDix1dMt2kQKQ==";
      };
    };
    "lodash-4.17.20" = {
      name = "lodash";
      packageName = "lodash";
      version = "4.17.20";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.20.tgz";
        sha512 = "PlhdFcillOINfeV7Ni6oF1TAEayyZBoZ8bcshTHqOYJYlrqzRK5hagpagky5o4HfCzzd1TRkXPMFq6cKk9rGmA==";
      };
    };
    "minimatch-3.0.4" = {
      name = "minimatch";
      packageName = "minimatch";
      version = "3.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz";
        sha512 = "yJHVQEhyqPLUTgt9B83PXu6W3rx4MvvHvSUvToogpwoGDOUQ+yDrR0HRot+yOCdCO7u4hX3pWft6kWBBcqh0UA==";
      };
    };
    "minimist-1.2.5" = {
      name = "minimist";
      packageName = "minimist";
      version = "1.2.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-1.2.5.tgz";
        sha512 = "FM9nNUYrRBAELZQT3xeZQ7fmMOBg6nWNmJKTcgsJeaLstP/UODVpGsr5OhXhhXg6f+qtJ8uiZ+PUxkDWcgIXLw==";
      };
    };
    "mkdirp-0.5.5" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "0.5.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz";
        sha512 = "NKmAlESf6jMGym1++R0Ra7wvhV+wFW63FaSOFPwRahvea0gMUcGUhVeAg/0BC0wiv9ih5NYPB1Wn1UEI1/L+xQ==";
      };
    };
    "ms-2.1.2" = {
      name = "ms";
      packageName = "ms";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz";
        sha512 = "sGkPx+VjMtmA6MX27oA4FBFELFCZZ4S4XqeGOXCv68tT+jb3vk/RyaKWP0PTKyWtmLSM0b+adUTEvbs1PEaH2w==";
      };
    };
    "natural-compare-1.4.0" = {
      name = "natural-compare";
      packageName = "natural-compare";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz";
        sha1 = "4abebfeed7541f2c27acfb29bdbbd15c8d5ba4f7";
      };
    };
    "once-1.4.0" = {
      name = "once";
      packageName = "once";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
      };
    };
    "optionator-0.9.1" = {
      name = "optionator";
      packageName = "optionator";
      version = "0.9.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/optionator/-/optionator-0.9.1.tgz";
        sha512 = "74RlY5FCnhq4jRxVUPKDaRwrVNXMqsGsiW6AJw4XK8hmtm10wC0ypZBLw5IIp85NZMr91+qd1RvvENwg7jjRFw==";
      };
    };
    "parent-module-1.0.1" = {
      name = "parent-module";
      packageName = "parent-module";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/parent-module/-/parent-module-1.0.1.tgz";
        sha512 = "GQ2EWRpQV8/o+Aw8YqtfZZPfNRWZYkbidE9k5rpl/hC3vtHHBfGm2Ifi6qWV+coDGkrUKZAxE3Lot5kcsRlh+g==";
      };
    };
    "path-is-absolute-1.0.1" = {
      name = "path-is-absolute";
      packageName = "path-is-absolute";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        sha1 = "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f";
      };
    };
    "path-key-3.1.1" = {
      name = "path-key";
      packageName = "path-key";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz";
        sha512 = "ojmeN0qd+y0jszEtoY48r0Peq5dwMEkIlCOu6Q5f41lfkswXuKtYrhgoTpLnyIcHm24Uhqx+5Tqm2InSwLhE6Q==";
      };
    };
    "prelude-ls-1.2.1" = {
      name = "prelude-ls";
      packageName = "prelude-ls";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.2.1.tgz";
        sha512 = "vkcDPrRZo1QZLbn5RLGPpg/WmIQ65qoWWhcGKf/b5eplkkarX0m9z8ppCat4mlOqUsWpyNuYgO3VRyrYHSzX5g==";
      };
    };
    "progress-2.0.3" = {
      name = "progress";
      packageName = "progress";
      version = "2.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/progress/-/progress-2.0.3.tgz";
        sha512 = "7PiHtLll5LdnKIMw100I+8xJXR5gW2QwWYkT6iJva0bXitZKa/XMrSbdmg3r2Xnaidz9Qumd0VPaMrZlF9V9sA==";
      };
    };
    "punycode-2.1.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz";
        sha512 = "XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A==";
      };
    };
    "regexpp-3.1.0" = {
      name = "regexpp";
      packageName = "regexpp";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/regexpp/-/regexpp-3.1.0.tgz";
        sha512 = "ZOIzd8yVsQQA7j8GCSlPGXwg5PfmA1mrq0JP4nGhh54LaKN3xdai/vHUDu74pKwV8OxseMS65u2NImosQcSD0Q==";
      };
    };
    "resolve-from-4.0.0" = {
      name = "resolve-from";
      packageName = "resolve-from";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz";
        sha512 = "pb/MYmXstAkysRFx8piNI1tGFNQIFA3vkE3Gq4EuA1dF6gHp/+vgZqsCGJapvy8N3Q+4o7FwvquPJcnZ7RYy4g==";
      };
    };
    "rimraf-2.6.3" = {
      name = "rimraf";
      packageName = "rimraf";
      version = "2.6.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/rimraf/-/rimraf-2.6.3.tgz";
        sha512 = "mwqeW5XsA2qAejG46gYdENaxXjx9onRNCfn7L0duuP4hCuTIi/QO7PDK07KJfp1d+izWPrzEJDcSqBa0OZQriA==";
      };
    };
    "semver-7.3.2" = {
      name = "semver";
      packageName = "semver";
      version = "7.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/semver/-/semver-7.3.2.tgz";
        sha512 = "OrOb32TeeambH6UrhtShmF7CRDqhL6/5XpPNp2DuRH6+9QLw/orhp72j87v8Qa1ScDkvrrBNpZcDejAirJmfXQ==";
      };
    };
    "shebang-command-2.0.0" = {
      name = "shebang-command";
      packageName = "shebang-command";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz";
        sha512 = "kHxr2zZpYtdmrN1qDjrrX/Z1rR1kG8Dx+gkpK1G4eXmvXswmcE1hTWBWYUzlraYw1/yZp6YuDY77YtvbN0dmDA==";
      };
    };
    "shebang-regex-3.0.0" = {
      name = "shebang-regex";
      packageName = "shebang-regex";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz";
        sha512 = "7++dFhtcx3353uBaq8DDR4NuxBetBzC7ZQOhmTQInHEd6bSrXdiEyzCvG07Z44UYdLShWUyXt5M/yhz8ekcb1A==";
      };
    };
    "slice-ansi-2.1.0" = {
      name = "slice-ansi";
      packageName = "slice-ansi";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/slice-ansi/-/slice-ansi-2.1.0.tgz";
        sha512 = "Qu+VC3EwYLldKa1fCxuuvULvSJOKEgk9pi8dZeCVK7TqBfUNTH4sFkk4joj8afVSfAYgJoSOetjx9QWOJ5mYoQ==";
      };
    };
    "sprintf-js-1.0.3" = {
      name = "sprintf-js";
      packageName = "sprintf-js";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz";
        sha1 = "04e6926f662895354f3dd015203633b857297e2c";
      };
    };
    "string-width-3.1.0" = {
      name = "string-width";
      packageName = "string-width";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/string-width/-/string-width-3.1.0.tgz";
        sha512 = "vafcv6KjVZKSgz06oM/H6GDBrAtz8vdhQakGjFIvNrHA6y3HCF1CInLy+QLq8dTJPQ1b+KDUqDFctkdRW44e1w==";
      };
    };
    "strip-ansi-5.2.0" = {
      name = "strip-ansi";
      packageName = "strip-ansi";
      version = "5.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-5.2.0.tgz";
        sha512 = "DuRs1gKbBqsMKIZlrffwlug8MHkcnpjs5VPmL1PAh+mA30U0DTotfDZ0d2UUsXpPmPmMMJ6W773MaA3J+lbiWA==";
      };
    };
    "strip-ansi-6.0.0" = {
      name = "strip-ansi";
      packageName = "strip-ansi";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.0.tgz";
        sha512 = "AuvKTrTfQNYNIctbR1K/YGTR1756GycPsg7b9bdV9Duqur4gv6aKqHXah67Z8ImS7WEz5QVcOtlfW2rZEugt6w==";
      };
    };
    "strip-json-comments-3.1.1" = {
      name = "strip-json-comments";
      packageName = "strip-json-comments";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-3.1.1.tgz";
        sha512 = "6fPc+R4ihwqP6N/aIv2f1gMH8lOVtWQHoqC4yK6oSDVVocumAsfCqjkXnqiYMhmMwS/mEHLp7Vehlt3ql6lEig==";
      };
    };
    "supports-color-5.5.0" = {
      name = "supports-color";
      packageName = "supports-color";
      version = "5.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz";
        sha512 = "QjVjwdXIt408MIiAqCX4oUKsgU2EqAGzs2Ppkm4aQYbjm+ZEWEcW4SfFNTr4uMNZma0ey4f5lgLrkB0aX0QMow==";
      };
    };
    "supports-color-7.1.0" = {
      name = "supports-color";
      packageName = "supports-color";
      version = "7.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/supports-color/-/supports-color-7.1.0.tgz";
        sha512 = "oRSIpR8pxT1Wr2FquTNnGet79b3BWljqOuoW/h4oBhxJ/HUbX5nX6JSruTkvXDCFMwDPvsaTTbvMLKZWSy0R5g==";
      };
    };
    "table-5.4.6" = {
      name = "table";
      packageName = "table";
      version = "5.4.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/table/-/table-5.4.6.tgz";
        sha512 = "wmEc8m4fjnob4gt5riFRtTu/6+4rSe12TpAELNSqHMfF3IqnA+CH37USM6/YR3qRZv7e56kAEAtd6nKZaxe0Ug==";
      };
    };
    "text-table-0.2.0" = {
      name = "text-table";
      packageName = "text-table";
      version = "0.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/text-table/-/text-table-0.2.0.tgz";
        sha1 = "7f5ee823ae805207c00af2df4a84ec3fcfa570b4";
      };
    };
    "type-check-0.4.0" = {
      name = "type-check";
      packageName = "type-check";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/type-check/-/type-check-0.4.0.tgz";
        sha512 = "XleUoc9uwGXqjWwXaUTZAmzMcFZ5858QA2vvx1Ur5xIcixXIP+8LnFDgRplU30us6teqdlskFfu+ae4K79Ooew==";
      };
    };
    "type-fest-0.8.1" = {
      name = "type-fest";
      packageName = "type-fest";
      version = "0.8.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/type-fest/-/type-fest-0.8.1.tgz";
        sha512 = "4dbzIzqvjtgiM5rw1k5rEHtBANKmdudhGyBEajN01fEyhaAIhsoKNy6y7+IN93IfpFtwY9iqi7kD+xwKhQsNJA==";
      };
    };
    "uri-js-4.2.2" = {
      name = "uri-js";
      packageName = "uri-js";
      version = "4.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/uri-js/-/uri-js-4.2.2.tgz";
        sha512 = "KY9Frmirql91X2Qgjry0Wd4Y+YTdrdZheS8TFwvkbLWf/G5KNJDCh6pKL5OZctEW4+0Baa5idK2ZQuELRwPznQ==";
      };
    };
    "v8-compile-cache-2.1.1" = {
      name = "v8-compile-cache";
      packageName = "v8-compile-cache";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/v8-compile-cache/-/v8-compile-cache-2.1.1.tgz";
        sha512 = "8OQ9CL+VWyt3JStj7HX7/ciTL2V3Rl1Wf5OL+SNTm0yK1KvtReVulksyeRnCANHHuUxHlQig+JJDlUhBt1NQDQ==";
      };
    };
    "which-2.0.2" = {
      name = "which";
      packageName = "which";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/which/-/which-2.0.2.tgz";
        sha512 = "BLI3Tl1TW3Pvl70l3yq3Y64i+awpwXqsGBYWkkqMtnbXgrMD+yj7rhW0kuEDxzJaYXGjEW5ogapKNMEKNMjibA==";
      };
    };
    "word-wrap-1.2.3" = {
      name = "word-wrap";
      packageName = "word-wrap";
      version = "1.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.3.tgz";
        sha512 = "Hz/mrNwitNRh/HUAtM/VT/5VH+ygD6DV7mYKZAtHOrbs8U7lvPS6xf7EJKMF0uW1KJCl0H701g3ZGus+muE5vQ==";
      };
    };
    "wrappy-1.0.2" = {
      name = "wrappy";
      packageName = "wrappy";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    };
    "write-1.0.3" = {
      name = "write";
      packageName = "write";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/write/-/write-1.0.3.tgz";
        sha512 = "/lg70HAjtkUgWPVZhZcm+T4hkL8Zbtp1nFNOn3lRrxnlv50SRBv7cR7RqR+GMsd3hUXy9hWBo4CHTbFTcOYwig==";
      };
    };
  };
  args = {
    name = "eslint";
    packageName = "eslint";
    version = "7.7.0";
    src = fetchurl { url = "https://registry.npmjs.org/eslint/-/eslint-7.7.0.tgz"; sha1 = "18beba51411927c4b64da0a8ceadefe4030d6073"; };
    dependencies = [
      sources."@babel/code-frame-7.10.4"
      sources."@babel/helper-validator-identifier-7.10.4"
      (sources."@babel/highlight-7.10.4" // {
        dependencies = [
          sources."chalk-2.4.2"
        ];
      })
      sources."@types/color-name-1.1.1"
      sources."acorn-7.4.0"
      sources."acorn-jsx-5.2.0"
      sources."ajv-6.12.4"
      sources."ansi-colors-4.1.1"
      sources."ansi-regex-5.0.0"
      sources."ansi-styles-3.2.1"
      sources."argparse-1.0.10"
      sources."astral-regex-1.0.0"
      sources."balanced-match-1.0.0"
      sources."brace-expansion-1.1.11"
      sources."callsites-3.1.0"
      (sources."chalk-4.1.0" // {
        dependencies = [
          sources."ansi-styles-4.2.1"
          sources."color-convert-2.0.1"
          sources."color-name-1.1.4"
          sources."has-flag-4.0.0"
          sources."supports-color-7.1.0"
        ];
      })
      sources."color-convert-1.9.3"
      sources."color-name-1.1.3"
      sources."concat-map-0.0.1"
      sources."cross-spawn-7.0.3"
      sources."debug-4.2.0"
      sources."deep-is-0.1.3"
      sources."doctrine-3.0.0"
      sources."emoji-regex-7.0.3"
      sources."enquirer-2.3.6"
      sources."escape-string-regexp-1.0.5"
      sources."eslint-scope-5.1.0"
      sources."eslint-utils-2.1.0"
      sources."eslint-visitor-keys-1.3.0"
      sources."espree-7.2.0"
      sources."esprima-4.0.1"
      (sources."esquery-1.3.1" // {
        dependencies = [
          sources."estraverse-5.2.0"
        ];
      })
      sources."esrecurse-4.2.1"
      sources."estraverse-4.3.0"
      sources."esutils-2.0.3"
      sources."fast-deep-equal-3.1.3"
      sources."fast-json-stable-stringify-2.1.0"
      sources."fast-levenshtein-2.0.6"
      sources."file-entry-cache-5.0.1"
      sources."flat-cache-2.0.1"
      sources."flatted-2.0.2"
      sources."fs.realpath-1.0.0"
      sources."functional-red-black-tree-1.0.1"
      sources."glob-7.1.6"
      sources."glob-parent-5.1.1"
      sources."globals-12.4.0"
      sources."has-flag-3.0.0"
      sources."ignore-4.0.6"
      sources."import-fresh-3.2.1"
      sources."imurmurhash-0.1.4"
      sources."inflight-1.0.6"
      sources."inherits-2.0.4"
      sources."is-extglob-2.1.1"
      sources."is-fullwidth-code-point-2.0.0"
      sources."is-glob-4.0.1"
      sources."isexe-2.0.0"
      sources."js-tokens-4.0.0"
      sources."js-yaml-3.14.0"
      sources."json-schema-traverse-0.4.1"
      sources."json-stable-stringify-without-jsonify-1.0.1"
      sources."levn-0.4.1"
      sources."lodash-4.17.20"
      sources."minimatch-3.0.4"
      sources."minimist-1.2.5"
      sources."mkdirp-0.5.5"
      sources."ms-2.1.2"
      sources."natural-compare-1.4.0"
      sources."once-1.4.0"
      sources."optionator-0.9.1"
      sources."parent-module-1.0.1"
      sources."path-is-absolute-1.0.1"
      sources."path-key-3.1.1"
      sources."prelude-ls-1.2.1"
      sources."progress-2.0.3"
      sources."punycode-2.1.1"
      sources."regexpp-3.1.0"
      sources."resolve-from-4.0.0"
      sources."rimraf-2.6.3"
      sources."semver-7.3.2"
      sources."shebang-command-2.0.0"
      sources."shebang-regex-3.0.0"
      sources."slice-ansi-2.1.0"
      sources."sprintf-js-1.0.3"
      (sources."string-width-3.1.0" // {
        dependencies = [
          sources."ansi-regex-4.1.0"
          sources."strip-ansi-5.2.0"
        ];
      })
      sources."strip-ansi-6.0.0"
      sources."strip-json-comments-3.1.1"
      sources."supports-color-5.5.0"
      sources."table-5.4.6"
      sources."text-table-0.2.0"
      sources."type-check-0.4.0"
      sources."type-fest-0.8.1"
      sources."uri-js-4.2.2"
      sources."v8-compile-cache-2.1.1"
      sources."which-2.0.2"
      sources."word-wrap-1.2.3"
      sources."wrappy-1.0.2"
      sources."write-1.0.3"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "An AST-based pattern checker for JavaScript.";
      homepage = https://eslint.org/;
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