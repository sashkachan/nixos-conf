with import <nixpkgs> {}; {
	javaEnv = stdenv.mkDerivation {
		name = "java-env";
		JAVA_HOME = "${jdk8}";
		shellHook = ''
			alias gradle="${jdk8}/bin/java -classpath ${gradle}/lib/gradle/lib/gradle-launcher*.jar org.gradle.launcher.GradleMain ";
		'';
		buildInputs = [
			idea.idea-community
			jdk8
			gradle
			git 
		];
	};
}

