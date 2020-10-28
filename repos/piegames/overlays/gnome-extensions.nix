self: super: {
	gnomeExtensions = (super.gnomeExtensions // rec {
		buildShellExtension = self.callPackage ../pkgs/buildGnomeExtension.nix {};

		dash-to-panel = super.gnomeExtensions.dash-to-panel.overrideAttrs (old: {
			version = "40";

			src = self.fetchFromGitHub {
				owner = "home-sweet-gnome";
				repo = "dash-to-panel";
				rev = "v40";
				sha256 = "07jq8d16nn62ikis896nyfn3q02f5srj754fmiblhz472q4ljc3p";
			};
		});
		emoji-selector = self.gnomeExtensions.buildShellExtension {
			pname = "gnome-shell-extension-emoji-selector";
			uuid = "emoji-selector@maestroschan.fr";
			version = 20;
			sha256 = "1i6py149m46xig5a0ry7y5v887nlzw644mw72gcr2hkfsn8b0gnd";
		};
		cpu-power-manager = self.gnomeExtensions.buildShellExtension {
			pname = "gnome-shell-extension-cpu-power-manager";
			uuid = "cpupower@mko-sl.de";
			version = 21;
			sha256 = "1p7ffcl1dzr84f7nhaaqi4kyzm7ywf0wdfz7lrvrmhlnqmmhq3f5";
		};
		lock-screen-blur = self.gnomeExtensions.buildShellExtension {
			pname = "gnome-shell-extension-lock-sceen-blur";
			uuid = "ControlBlurEffectOnLockScreen@pratap.fastmail.fm";
			version = 4;
			sha256 = "00fbw5mp8hr3myyan81f2kh7ihs1q1cr6p60dgyi2r0xw5d8yqhf";
		};
		extension-reloader = self.gnomeExtensions.buildShellExtension {
			pname = "gnome-shell-extension-reloader";
			uuid = "extension-reloader@nls1729";
			version = 12;
			sha256 = "0l1dgkr2k40vy0a3c35s3xr99ff48n1wwc6x4rxg4zdwlbmarrsy";
		};
		tray-icons = self.gnomeExtensions.buildShellExtension {
			pname = "gnome-shell-extension-tray-icons";
			uuid = "tray-icons@zhangkaizhao.com";
			version = 4;
			sha256 = "0viq0wwhhcszsybk2jxhla1chinj552xcc5pbyn55j061aql514r";
		};
	});
}
