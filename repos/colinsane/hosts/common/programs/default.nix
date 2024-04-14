{ pkgs, ... }:

{
  imports = [
    ./abaddon.nix
    ./aerc.nix
    ./alacritty.nix
    ./alsa-ucm-conf
    ./animatch.nix
    ./assorted.nix
    ./audacity.nix
    ./bemenu.nix
    ./blast-ugjka
    ./bonsai.nix
    ./brave.nix
    ./bubblewrap.nix
    ./calls.nix
    ./cantata.nix
    ./catt.nix
    ./celeste64.nix
    ./chatty.nix
    ./conky
    ./cozy.nix
    ./cups.nix
    ./curlftpfs.nix
    ./dconf.nix
    ./deadd-notification-center
    ./dialect.nix
    ./dino.nix
    ./dissent.nix
    ./element-desktop.nix
    ./engrampa.nix
    ./epiphany.nix
    ./evince.nix
    ./fcitx5.nix
    ./feedbackd.nix
    ./firefox.nix
    ./firejail.nix
    ./flare-signal.nix
    ./fontconfig.nix
    ./fractal.nix
    ./frozen-bubble.nix
    ./fwupd.nix
    ./g4music.nix
    ./gajim.nix
    ./gdbus.nix
    ./geary.nix
    ./git.nix
    ./gnome-feeds.nix
    ./gnome-keyring
    ./gnome-maps.nix
    ./gnome-weather.nix
    ./go2tv.nix
    ./gpodder.nix
    ./grimshot.nix
    ./gthumb.nix
    ./gvfs.nix
    ./handbrake.nix
    ./helix.nix
    ./htop
    ./imagemagick.nix
    ./jellyfin-media-player.nix
    ./kdenlive.nix
    ./komikku.nix
    ./koreader
    ./less.nix
    ./libreoffice.nix
    ./lemoa.nix
    ./loupe.nix
    ./mako.nix
    ./megapixels.nix
    ./mepo.nix
    ./mimeo
    ./mopidy.nix
    ./mpv
    ./msmtp.nix
    ./nautilus.nix
    ./neovim.nix
    ./newsflash.nix
    ./nheko.nix
    ./nicotine-plus.nix
    ./nix-index.nix
    ./notejot.nix
    ./ntfy-sh.nix
    ./objdump.nix
    ./obsidian.nix
    ./offlineimap.nix
    ./open-in-mpv.nix
    ./pipewire.nix
    ./planify.nix
    ./portfolio-filemanager.nix
    ./playerctl.nix
    ./rhythmbox.nix
    ./ripgrep.nix
    ./rofi
    ./s6-rc.nix
    ./sane-input-handler
    ./sane-screenshot.nix
    ./sane-scripts.nix
    ./schlock.nix
    ./sfeed.nix
    ./signal-desktop.nix
    ./splatmoji.nix
    ./spot.nix
    ./spotify.nix
    ./steam.nix
    ./stepmania.nix
    ./strings.nix
    ./sublime-music.nix
    ./supertuxkart.nix
    ./sway
    ./sway-autoscaler
    ./swayidle.nix
    ./swaylock.nix
    ./swaynotificationcenter
    ./sysvol.nix
    ./tangram.nix
    ./tor-browser.nix
    ./tuba.nix
    ./unl0kr
    ./vlc.nix
    ./waybar
    ./waylock.nix
    ./wike.nix
    ./wine.nix
    ./wireplumber.nix
    ./wireshark.nix
    ./wvkbd.nix
    ./xarchiver.nix
    ./xdg-desktop-portal.nix
    ./xdg-desktop-portal-gtk.nix
    ./xdg-desktop-portal-wlr.nix
    ./xdg-terminal-exec.nix
    ./xdg-utils.nix
    ./zathura.nix
    ./zeal.nix
    ./zecwallet-lite.nix
    ./zsh
  ];

  # XXX: this might not be necessary. try removing this and cacert.unbundled (servo)?
  environment.etc."ssl/certs".source = "${pkgs.cacert.unbundled}/etc/ssl/certs/*";
}
