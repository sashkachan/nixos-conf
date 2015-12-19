{
  packageOverrides = pkgs_: with pkgs_; {
    all = with pkgs; buildEnv {
      name = "all";
      paths = [
	jdk8-linux
	phpstorm
	idea-community
	go
      ];
    };
  };
}
