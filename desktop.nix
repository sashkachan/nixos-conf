{config, pkgs, ...}:
{
	nixpkgs.config.packageOverrides = {
		docker = pkgs.callPackage ./nixpkgs/pkgs/applications/virtualization/docker {};
		chromium = pkgs.callPackage ./nixpkgs/pkgs/applications/networking/browsers/chromium {
			pulseSupport = true;
			enableWideVine = true;
		};
		openssl_1_0_1 = pkgs.openssl;
		GConf = pkgs.gnome.GConf;
		btrfs-progs = pkgs.callPackage ./nixpkgs/pkgs/tools/filesystems/btrfs-progs { };
		tmux = pkgs.callPackage ./nixpkgs/pkgs/tools/misc/tmux {};
		spotify = pkgs.callPackage ./nixpkgs/pkgs/applications/audio/spotify {};
		redshift = pkgs.callPackage ./nixpkgs/pkgs/applications/misc/redshift {
			pyxdg = pkgs.python3Packages.pyxdg;
		};
	};
	environment.systemPackages = with pkgs;  [
		btrfs-progs
		go
		docker
		tmux
		vlc
		chromium
		dropbox
		spotify
		redshift
 	];
}
