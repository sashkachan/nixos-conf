# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			./dev.nix
			./emacs.nix
		];

	boot.loader.gummiboot.enable = true;
	networking.hostName = "alnix";
	networking.wireless.enable = true;
	networking.networkmanager.enable = false;
	networking.useDHCP = true;
	system.stateVersion = "15.09";

	virtualisation.docker.enable = true;
	virtualisation.docker.socketActivation = false;

	boot.kernelPackages = pkgs.linuxPackages_4_3;

	i18n = {
		consoleFont = "Lat2-Terminus16";
		consoleKeyMap = "dvorak";
		defaultLocale = "en_US.UTF-8";
	};

	time.timeZone = "Europe/Amsterdam";
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		alsaLib
		alsaPlugins
		alsaUtils
		gdb
		gcc
		man
		openvpn
		xlaunch
		tcpdump
		unzip
		xlibs.xev
		xlibs.xinput
		xlibs.xmessage
		xlibs.xmodmap

		wget
		gnumake
		dmenu
		emacs
		zsh  
		curl
		xclip
		tmux
		htop
		zsh
		dropbox
		mesa
		ffmpeg
		vim
		docker
		git
		vagrant
		spotify
		chromium
		tlp
		nettools
		i3status
		i3lock
	];
	security.setuidPrograms = [
    	"xlaunch"
  	];

	services.openssh.enable = true;

	services.xserver.enable = true;
	services.xserver.layout = "us";
	services.xserver.xkbVariant = "dvp";
	services.xserver.xkbOptions = "ctrl:nocaps";
	services.xserver.exportConfiguration = true;

	services.xserver.desktopManager.gnome3.enable = true;
	services.xserver.desktopManager.xterm.enable = false;
	services.xserver.displayManager.sddm.enable = true;
	services.xserver.windowManager.i3.enable = true;
	services.xserver.windowManager.default = "i3";
	services.tlp.enable = true;
	programs.zsh.enable = true;

	hardware = {
		trackpoint = {
			enable = true;
			speed = 255;
			sensitivity = 255;
			emulateWheel = true;
		};
	};


	users.extraUsers.alg = {
		isNormalUser = true;
		uid = 1000;
		useDefaultShell = false;
		initialPassword = "test";
		extraGroups = [ "wheel" "docker" ];
		shell = "/run/current-system/sw/bin/zsh";
	};

  	system.activationScripts =
  	{
    		dotfiles = lib.stringAfter [ "users" ]
    		''
      		cd /home/alg
		rm -rf dotfiles
      		${pkgs.git}/bin/git clone https://github.com/alex-glv/dotfiles.git
      		cd dotfiles
      		${pkgs.gnumake}/bin/make GIT='${pkgs.git}/bin/git' all
    		'';

  	};
}
