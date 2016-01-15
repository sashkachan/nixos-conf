with import <forkpkgs> {}; {
	phpEnv = stdenv.mkDerivation {
		name = "php-env";
		JAVA_HOME = "${jdk8}";
		buildInputs = [
			idea.phpstorm
			git 
		];
	};
}

