with import <nixpkgs> {}; {
	javaEnv = stdenv.mkDerivation {
		name = "java-env";
		JAVA_HOME = "${jdk8}";
		buildInputs = [
			idea.phpstorm
			jdk8
			git 
		];
	};
}

