{config, pkgs, lib, stdenv, ...}:
{
	nixpkgs.config.packageOverrides = pkgs: {
		docker = pkgs.lib.overrideDerivation pkgs.docker (attrs : import ./env/docker191.nix {pkgs = pkgs;} );
	};
	environment.systemPackages = with pkgs;  [
		go
		docker
 	];
}
