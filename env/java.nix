with import <forkpkgs> {}; {
	javaEnv = stdenv.mkDerivation {
		name = "java-env";
		JAVA_HOME = "${jdk}";
		buildInputs = [
			idea.idea-community
			jdk
			gradle
			git 
		];
	};
}

