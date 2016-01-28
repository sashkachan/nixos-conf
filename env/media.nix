{stdenv, pkgs }:

with pkgs;
stdenv.mkDerivation rec{
	name = "alg-env";
	buildInputs = [
		vlc
		dropbox
		spotify
		chromium
		calibre
		tmux
	];
}



