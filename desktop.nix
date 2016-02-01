{config, pkgs, lib, stdenv, ...}:
let forkpkgs = import ./nixpkgs {};
in 
{
	nixpkgs.config.packageOverrides = {
		docker = forkpkgs.docker;	
		#go = forkpkgs.go_1_5;
		#vlc = forkpkgs.vlc;
		#chromium = forkpkgs.chromium;
		#spotify = forkpkgs.spotify;
		#dropbox = forkpkgs.dropbox;
		#tmux = forkpkgs.tmux;
		#redshift = forkpkgs.redshift;
		
	};
	environment.systemPackages = with pkgs;  [
		go
		docker
		#calibre
		#chromium
		#tmux
		#vlc
		#dropbox
		#redshift
 	];
}
