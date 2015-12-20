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

	powerManagement.enable = true;
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

		bluez5
		wget
		gnumake
		gnused
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
		xss-lock
		feh
	];
	security.setuidPrograms = [
    	"xlaunch"
  	];

	services = {
		openssh = {
			enable = true;
		};
		tlp = {
			enable = true;
		};
		xserver = {
			enable = true;
			layout = "us";
			xkbVariant = "dvp";
			xkbOptions = "ctrl:nocaps";
			exportConfiguration = true;
			desktopManager = {
				gnome3 = {
					enable = true;
				};
				xterm = {
					enable = false;
				};
			};
			displayManager = {
				sddm = {
					enable = true;
				};
			};
			windowManager = {
				i3 = {
					enable = true;
				};
				default = "i3";
			};
		};
	};
	programs = {
		zsh = {
			enable = true;
		};
		light = {
			enable = true;
		};
	};

	hardware = {
		trackpoint = {
			enable = true;
			speed = 255;
			sensitivity = 255;
			emulateWheel = true;
		};
		pulseaudio = {
			enable = true;
			package = pkgs.pulseaudioFull;
		};
		bluetooth = {
			enable = true;
		};
		
	};


	users.extraUsers.alg = {
		isNormalUser = true;
		uid = 1000;
		useDefaultShell = false;
		initialPassword = "test";
		extraGroups = [ "wheel" "docker" "alg" ];
		shell = "/run/current-system/sw/bin/zsh";
	};

  	#system.activationScripts =
  	#{
    	#	dotfiles = lib.stringAfter [ "users" ]
    	#	''
      	#	cd /home/alg
	#	rm -rf dotfiles
      	#	cd dotfiles
	#	export PATH=${pkgs.gnused}/bin:$PATH
      	#	${pkgs.git}/bin/git clone https://github.com/alex-glv/dotfiles.git
      	#	${pkgs.gnumake}/bin/make GIT='${pkgs.git}/bin/git' all
	#	chown -R alg:alg /home/alg/
    	#	'';

  	#};
}
