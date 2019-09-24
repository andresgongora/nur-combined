{ buildFirefoxXpiAddon, fetchurl, stdenv }:
  {
    "auto-tab-discard" = buildFirefoxXpiAddon {
      pname = "auto-tab-discard";
      version = "0.3.2.1";
      addonId = "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3303929/auto_tab_discard-0.3.2.1-an+fx.xpi?src=";
      sha256 = "1dd91cb0c29ebb94b9b4a3407c46c7d60acd58e91a78b1876c82ceadeb4d430e";
      meta = with stdenv.lib;
      {
        homepage = "http://add0n.com/tab-discard.html";
        description = "Use native tab discard method to automatically reduce memory usage of inactive tabs";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "cookie-autodelete" = buildFirefoxXpiAddon {
      pname = "cookie-autodelete";
      version = "3.0.2";
      addonId = "CookieAutoDelete@kennydo.com";
      url = "https://addons.mozilla.org/firefox/downloads/file/1906813/cookie_autodelete-3.0.2-an+fx.xpi?src=";
      sha256 = "ec1abb6ae918a1ad63d3e878cf402dc02dde1e4470b0f4b32a3de29bc8eb003a";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/mrdokenny/Cookie-AutoDelete";
        description = "Control your cookies! This WebExtension is inspired by Self Destructing Cookies. When a tab closes, any cookies not being used are automatically deleted. Whitelist the ones you trust while deleting the rest. Support for Container Tabs.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "dark-night-mode" = buildFirefoxXpiAddon {
      pname = "dark-night-mode";
      version = "2.0.2";
      addonId = "{27c3c9d8-95cd-44e6-ae9c-ff537348b9f3}";
      url = "https://addons.mozilla.org/firefox/downloads/file/932525/dark_night_mode-2.0.2-an+fx.xpi?src=";
      sha256 = "8ee966c8bda37c5b2d9cb08d8801eedcfc5ba39959f78bb57d84bc0ab489bfbd";
      meta = with stdenv.lib;
      {
        homepage = "https://darknightmode.com";
        description = "It is a universal night mode for the entire Internet. It uses a special algorithm to automatically change the colors of the websites you visit into dark mode so that you can browse without straining your eyes, especially at night.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "dark-scroll-for-tweetdeck" = buildFirefoxXpiAddon {
      pname = "dark-scroll-for-tweetdeck";
      version = "2.0.0";
      addonId = "{759d3eb8-baf1-49e0-938b-0f963fdac3ae}";
      url = "https://addons.mozilla.org/firefox/downloads/file/1754743/dark_scroll_for_tweetdeck-2.0.0-fx.xpi?src=";
      sha256 = "e0f4e625eda09e9c8300ef650373d5a582a8c77c18eba572aa39d0bd8e3eb596";
      meta = with stdenv.lib;
      {
        description = "Makes the scrollbars on TweetDeck and other sites dark in Firefox. This should be done by the site itself, not by an addon :(\n\nImage based on Scroll by Juan Pablo Bravo, CL <a href=\"https://outgoing.prod.mozaws.net/v1/f9c83bffbd0bf3bfa6ea46deecfa4fa4e9d5a69f49f323c020877e0bf283efac/https%3A//thenounproject.com/term/scroll/18607/\" rel=\"nofollow\">https://thenounproject.com/term/scroll/18607/</a>";
        license = licenses.lgpl3;
        platforms = platforms.all;
        };
      };
    "darkreader" = buildFirefoxXpiAddon {
      pname = "darkreader";
      version = "4.8.1";
      addonId = "addon@darkreader.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3404143/dark_reader-4.8.1-an+fx.xpi?src=";
      sha256 = "ab519a410a55dffabc88a8e4a2e71e7cb72d1986452f64fcaebe57284d898045";
      meta = with stdenv.lib;
      {
        homepage = "https://darkreader.org/";
        description = "Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "decentraleyes" = buildFirefoxXpiAddon {
      pname = "decentraleyes";
      version = "2.0.12";
      addonId = "jid1-BoFifL9Vbdl2zQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3048828/decentraleyes-2.0.12-an+fx.xpi?src=";
      sha256 = "99e10c581e372ccf884f463954d5f1f4885d29c3a74a3fb4095140024e87200d";
      meta = with stdenv.lib;
      {
        homepage = "https://decentraleyes.org";
        description = "Protects you against tracking through \"free\", centralized, content delivery. It prevents a lot of requests from reaching networks like Google Hosted Libraries, and serves local files to keep sites from breaking. Complements regular content blockers.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "facebook-container" = buildFirefoxXpiAddon {
      pname = "facebook-container";
      version = "2.0.2";
      addonId = "@contain-facebook";
      url = "https://addons.mozilla.org/firefox/downloads/file/3383495/facebook_container-2.0.2-fx.xpi?src=";
      sha256 = "786b46086225c00c63db646302b4d38442027a79118b2b46f7f1bc93ba04f1bb";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/mozilla/contain-facebook";
        description = "Prevent Facebook from tracking you around the web. The Facebook Container extension for Firefox helps you take control and isolate your web activity from Facebook.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "gopass-bridge" = buildFirefoxXpiAddon {
      pname = "gopass-bridge";
      version = "0.5.1";
      addonId = "{eec37db0-22ad-4bf1-9068-5ae08df8c7e9}";
      url = "https://addons.mozilla.org/firefox/downloads/file/1200957/gopass_bridge-0.5.1-fx.xpi?src=";
      sha256 = "0e8829d4451bb34ceefd12c9baceffffabfc6ebc1f546d10568413332268bedd";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/gopasspw/gopassbridge";
        description = "Gopass Bridge allows searching and inserting login credentials from the gopass password manager ( <a rel=\"nofollow\" href=\"https://outgoing.prod.mozaws.net/v1/fa484fa7cde64c1be04f689a80902fdf34bfe274b8675213f619c3a13e6606ab/https%3A//www.gopass.pw/\">https://www.gopass.pw/</a> ).";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "greasemonkey" = buildFirefoxXpiAddon {
      pname = "greasemonkey";
      version = "4.9";
      addonId = "{e4a8a97b-f2ed-450b-b12d-ee082ba24781}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3024171/greasemonkey-4.9-an+fx.xpi?src=";
      sha256 = "a3c94257caa11c7ef4c9a61b2d898f82212a017aa3ab07e79bce07f98a25d4f1";
      meta = with stdenv.lib;
      {
        homepage = "http://www.greasespot.net/";
        description = "Customize the way a web page displays or behaves, by using small bits of JavaScript.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "header-editor" = buildFirefoxXpiAddon {
      pname = "header-editor";
      version = "4.0.7";
      addonId = "headereditor-amo@addon.firefoxcn.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/1677680/header_editor-4.0.7-an+fx.xpi?src=";
      sha256 = "8aaaefcfad6f281aee61f085c446d54afe223ff35bdde31426a01f682891d9b3";
      meta = with stdenv.lib;
      {
        homepage = "http://team.firefoxcn.net";
        description = "Manage browser's requests, include modify the request headers and response headers, redirect requests, cancel requests";
        license = licenses.gpl2;
        platforms = platforms.all;
        };
      };
    "https-everywhere" = buildFirefoxXpiAddon {
      pname = "https-everywhere";
      version = "2019.6.27";
      addonId = "https-everywhere@eff.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3060290/https_everywhere-2019.6.27-an+fx.xpi?src=";
      sha256 = "37bb2155496910fdcf093c6f40d7871bd9605b4bd0200498b1c7c29b2ca4831c";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/https-everywhere";
        description = "Encrypt the web! HTTPS Everywhere is a Firefox extension to protect your communications by enabling HTTPS encryption automatically on sites that are known to support it, even when you type URLs or follow links that omit the https: prefix.";
        platforms = platforms.all;
        };
      };
    "keepass-helper" = buildFirefoxXpiAddon {
      pname = "keepass-helper";
      version = "1.3";
      addonId = "{e56fa932-ad2c-4cfa-b0d7-a35db1d9b0f6}";
      url = "https://addons.mozilla.org/firefox/downloads/file/839803/keepass_helper_url_in_title-1.3-an+fx.xpi?src=";
      sha256 = "0ff5e82dd4526db8c7b8cddd7778f46d282de9f6fc4c1d11ac7aa7b0bbefe7e4";
      meta = with stdenv.lib;
      {
        description = "Puts a hostname or a URL in the window title.\nIt does not modify the title of a tab, just the window title.\nIt does not inject any JavaScript code to a website, so it can't corrupt, nor can it be corrupted by it.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "link-cleaner" = buildFirefoxXpiAddon {
      pname = "link-cleaner";
      version = "1.5";
      addonId = "{6d85dea2-0fb4-4de3-9f8c-264bce9a2296}";
      url = "https://addons.mozilla.org/firefox/downloads/file/671858/link_cleaner-1.5-an+fx.xpi?src=";
      sha256 = "1ecec8cbe78b4166fc50da83213219f30575a8c183f7a13aabbff466c71ce560";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/idlewan/link_cleaner";
        description = "Clean URLs that are about to be visited:\n- removes utm_* parameters\n- on item pages of aliexpress and amazon, removes tracking parameters\n- skip redirect pages of facebook, steam and reddit";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "multi-account-containers" = buildFirefoxXpiAddon {
      pname = "multi-account-containers";
      version = "6.1.0";
      addonId = "@testpilot-containers";
      url = "https://addons.mozilla.org/firefox/downloads/file/1400557/firefox_multi_account_containers-6.1.0-fx.xpi?src=";
      sha256 = "f4847e135b750e46bfc8f0b5dfd2375001216d781a014270477fad5f9b7a2242";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/mozilla/multi-account-containers/#readme";
        description = "Firefox Multi-Account Containers lets you keep parts of your online life separated into color-coded tabs that preserve your privacy. Cookies are separated by container, allowing you to use the web with multiple identities or accounts simultaneously.";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "octotree" = buildFirefoxXpiAddon {
      pname = "octotree";
      version = "3.0.8";
      addonId = "jid1-Om7eJGwA1U8Akg@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/2988920/octotree-3.0.8-fx.xpi?src=";
      sha256 = "1db1fe9336d2e1fc6ac3bd86a73f8500963b1e70e27d855d0c64ab06790f8a8b";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/buunguyen/octotree/";
        description = "Add-on to display GitHub code in tree format";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "peertubeify" = buildFirefoxXpiAddon {
      pname = "peertubeify";
      version = "0.6.0";
      addonId = "{01175c8e-4506-4263-bad9-d3ddfd4f5a5f}";
      url = "https://addons.mozilla.org/firefox/downloads/file/1687641/peertubeify-0.6.0-an+fx.xpi?src=";
      sha256 = "9ccd1eec053a1131629c60983d6fc5ff8ac96205bbcf5a1ed22c7bb46ad07d3b";
      meta = with stdenv.lib;
      {
        homepage = "https://gitlab.com/Ealhad/peertubeify";
        description = "PeerTubeify allows to redirect between YouTube and PeerTube and across PeerTube instances, automatically or by displaying a link.\n\nDon't forget to set your preferences :)\n\nPeerTubeify is not affiliated with PeerTube.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "plasma-integration" = buildFirefoxXpiAddon {
      pname = "plasma-integration";
      version = "1.6.1";
      addonId = "plasma-browser-integration@kde.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3392927/plasma_integration-1.6.1-fx.xpi?src=";
      sha256 = "e01aa8876a2e964afb1af5bd53218821a893ba98d824096b6159ff36bbbf8297";
      meta = with stdenv.lib;
      {
        homepage = "http://kde.org";
        description = "Multitask efficiently by controlling browser functions from the Plasma desktop.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "privacy-badger" = buildFirefoxXpiAddon {
      pname = "privacy-badger";
      version = "2019.7.1.1";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3285452/privacy_badger-2019.7.1.1-an+fx.xpi?src=";
      sha256 = "7bf4f0a7f527ac3d55f5917b994b2cbe2f4c907d57463f9bd8d04ffa82dc8dad";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/privacybadger";
        description = "Automatically learns to block invisible trackers.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "reddit-enhancement-suite" = buildFirefoxXpiAddon {
      pname = "reddit-enhancement-suite";
      version = "5.16.10";
      addonId = "jid1-xUfzOsOFlzSOXg@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3021433/reddit_enhancement_suite-5.16.10-an+fx.xpi?src=";
      sha256 = "d5aa1b4dc4c5336e4e8e53ba76813639135440030d6369b07a2708543384df15";
      meta = with stdenv.lib;
      {
        homepage = "https://redditenhancementsuite.com/";
        description = "NOTE: Reddit Enhancement Suite is developed independently, and is not officially endorsed by or affiliated with reddit.\n\nRES is a suite of tools to enhance your reddit browsing experience.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "refined-github" = buildFirefoxXpiAddon {
      pname = "refined-github";
      version = "19.9.19";
      addonId = "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3407314/refined_github-19.9.19-an+fx.xpi?src=";
      sha256 = "33c64a7daa2c2ac12687696fa1c83911f687b32525c18fb6fced4ea086b45978";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/sindresorhus/refined-github";
        description = "Simplifies the GitHub interface and adds many useful features.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "save-page-we" = buildFirefoxXpiAddon {
      pname = "save-page-we";
      version = "16.1";
      addonId = "savepage-we@DW-dev";
      url = "https://addons.mozilla.org/firefox/downloads/file/3407037/save_page_we-16.1-fx.xpi?src=";
      sha256 = "acc3fa86462a47003b2e68566906a726fe674f877c30f3970c56abbc063f1904";
      meta = with stdenv.lib;
      {
        description = "Save a complete web page (as curently displayed) as a single HTML file that can be opened in any browser. Choose which items to save. Define the format of the saved filename. Enter user comments.";
        license = licenses.gpl2;
        platforms = platforms.all;
        };
      };
    "stylus" = buildFirefoxXpiAddon {
      pname = "stylus";
      version = "1.5.6";
      addonId = "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3401561/stylus-1.5.6-fx.xpi?src=";
      sha256 = "4ac675d1b5e2edb837bef2bed6044b9be3a7af24201080728f194e46b1ed025f";
      meta = with stdenv.lib;
      {
        homepage = "https://add0n.com/stylus.html";
        description = "Redesign your favorite websites with Stylus, an actively developed and community driven userstyles manager. Easily install custom themes from popular online repositories, or create, edit, and manage your own personalized CSS stylesheets.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "swedish-dictionary" = buildFirefoxXpiAddon {
      pname = "swedish-dictionary";
      version = "1.20";
      addonId = "swedish@dictionaries.addons.mozilla.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/2987939/swedish_dictionary-1.20.xpi?src=";
      sha256 = "61dc7f5f79676573c603492ac57699cec81680b259751e3655bf90631c207271";
      meta = with stdenv.lib;
      {
        description = "Swedish spell-check dictionary.";
        license = licenses.lgpl3;
        platforms = platforms.all;
        };
      };
    "text-contrast-for-dark-themes" = buildFirefoxXpiAddon {
      pname = "text-contrast-for-dark-themes";
      version = "2.1.5";
      addonId = "jid1-nMVE2oP40qeQDQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/1721952/text_contrast_for_dark_themes-2.1.5-fx.xpi?src=";
      sha256 = "386731f1a34fbc76c8b719dc98ce7b91c712cb047da3da9c058b1af20fa26fd5";
      meta = with stdenv.lib;
      {
        description = "Fixes low-contrast text when using a dark desktop theme.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "transparent-standalone-image" = buildFirefoxXpiAddon {
      pname = "transparent-standalone-image";
      version = "2.1";
      addonId = "jid0-ezUl0hF1SPM9hLO5BMBkNoblB8s@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/738931/transparent_standalone_images-2.1-an+fx.xpi?src=";
      sha256 = "f56bc840d5ac96d1697feed57e7ab0928ff2c47232e236d00560efc2f3bf57b5";
      meta = with stdenv.lib;
      {
        description = "This add-on renders standalone images on a transparent background, so you can see the image in all its glory!";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.22.2";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3398284/ublock_origin-1.22.2-an+fx.xpi?src=";
      sha256 = "85ceffa542f0fa0ce3b1b481314098d2941413f04d464b70db7ef7c99dc81078";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "umatrix" = buildFirefoxXpiAddon {
      pname = "umatrix";
      version = "1.4.0";
      addonId = "uMatrix@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3396815/umatrix-1.4.0-an+fx.xpi?src=";
      sha256 = "991f0fa5c64172b8a2bc0a010af60743eba1c18078c490348e1c6631882cbfc7";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/gorhill/uMatrix";
        description = "Point &amp; click to forbid/allow any class of requests made by your browser. Use it to block scripts, iframes, ads, facebook, etc.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "vim-vixen" = buildFirefoxXpiAddon {
      pname = "vim-vixen";
      version = "0.24";
      addonId = "vim-vixen@i-beam.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3395145/vim_vixen-0.24-an+fx.xpi?src=";
      sha256 = "19555c6b38704035e0cb7635ae20552985c996f4555795d88036bc3830782765";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/ueokande/vim-vixen";
        description = "An add-on which allows you to navigate with vim-like bindings.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "zoom-page-we" = buildFirefoxXpiAddon {
      pname = "zoom-page-we";
      version = "15.2";
      addonId = "zoompage-we@DW-dev";
      url = "https://addons.mozilla.org/firefox/downloads/file/3409575/zoom_page_we-15.2-fx.xpi?src=";
      sha256 = "0adc39e165581a8a74ecc51ec4dc5310e809c7ab9e58258884d2a035680c1ec8";
      meta = with stdenv.lib;
      {
        description = "Zoom web pages (either per-site or per-tab) using full-page zoom, text-only zoom and minimum font size. Fit-to-width zooming can be applied to pages automatically. Fit-to-window scaling  can be applied to small images.";
        license = licenses.gpl2;
        platforms = platforms.all;
        };
      };
    }