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
		docker_compose = pkgs.pythonPackages.docker_compose;
		godef = pkgs.goPackages.godef.bin // {outputs = ["bin"]; };
		redshift = pkgs.callPackage ./nixpkgs/pkgs/applications/misc/redshift {
			pyxdg = pkgs.python3Packages.pyxdg;
		};
	};
	environment.systemPackages = with pkgs;  [
		google-cloud-sdk
		docker_compose
		btrfs-progs
		mercurial
		calibre
		xfce.thunar
		xfce.thunar_volman
		tmux
		nix-repl
		firefox
		go
		jdk
		gradle25
		drive
		hugo
		goimports
		godef	
		gocode
		docker
		idea.phpstorm
		idea.idea-community
		tmux
		vlc
		kismet
		chromium
		dropbox
		spotify
		redshift
 	];
}
