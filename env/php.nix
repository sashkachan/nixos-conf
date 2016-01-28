with import <forkpkgs> {}; {
	phpEnv = stdenv.mkDerivation {
		name = "php-env";
		JAVA_HOME = "${jdk}";
		buildInputs = [
			idea.phpstorm
			git 
		];
	};
}

