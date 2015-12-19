# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

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

	i18n = {
		consoleFont = "Lat2-Terminus16";
		consoleKeyMap = "dvorak";
		defaultLocale = "en_US.UTF-8";
	};

# Set your time zone.
	time.timeZone = "Europe/Amsterdam";
	nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
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
#gnome3
#gnome3.dconf
			dropbox
			mesa
			ffmpeg
			vim
			docker
			git
			vagrant
			spotify
#vlc
			chromium
			tlp
			nettools
			i3status
			i3lock
			];
	security.setuidPrograms = [
    	"xlaunch"
  	];

# Enable the OpenSSH daemon.
	services.openssh.enable = true;

# Enable CUPS to print documents. services.printing.enable = true;

# Enable the X11 windowing system.

	services.xserver.enable = true;
	services.xserver.layout = "us";
	services.xserver.xkbVariant = "dvorak";
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


# Define a user account. Don't forget to set a password with ‘passwd’.
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
    # Configure various dotfiles.
    dotfiles = stringAfter [ "users" ]
    ''
      cd /home/auntieneo
      git clone https://github.com/alex-glv/dotfiles.git
      cd dotfiles
      make
    '';

# FIXME: wpa_supplicant expects the wpa_supplicant.conf file to be in a read/write filesystem. This is a problem.
#    # Configure wireless networks
#    wpa_supplicant = ''  # FIXME: does this name have potential for conflict? must investigate
#      ln -fs ${./private/etc/wpa_supplicant.conf} /etc/wpa_supplicant.conf
#    '';
  };

# The NixOS release to be compatible with for stateful data such as 
# databases.
	system.stateVersion = "15.09";

	virtualisation.docker.enable = true;
	virtualisation.docker.socketActivation = false;

	boot.kernelPackages = pkgs.linuxPackages_4_3;
}
