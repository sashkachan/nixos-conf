{config, pkgs, ...}:
{
	nixpkgs.config.chromium = {
		enablePepperPDF = true;
		pulseSupport = true;
		enableWideVine = true;
	};
	nixpkgs.config.packageOverrides = {
		idea = pkgs.callPackage ./nixpkgs/pkgs/applications/editors/idea {};		
		hugo = pkgs.goPackages.hugo.bin // { outputs = ["bin"]; };
		kismet = pkgs.callPackage ./nixpkgs/pkgs/applications/networking/sniffers/kismet {};
		godef = pkgs.goPackages.godef.bin // {outputs = ["bin"]; };
		redshift = pkgs.callPackage ./nixpkgs/pkgs/applications/misc/redshift {
			pyxdg = pkgs.python3Packages.pyxdg;
		};
	};
	environment.systemPackages = with pkgs;  [
		btrfs-progs
		mercurial
		xfce.thunar
		xfce.thunar_volman
		tmux
		nix-repl
		firefox
		go
		drive
		hugo
		goimports
		godef	
		gocode
		docker
		idea.phpstorm
		tmux
		vlc
		kismet
		chromium
		dropbox
		spotify
		redshift
		jdk
 	];
}
