{config, pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
        jdk8
        idea.phpstorm
        idea.idea-community
        go
  ];
}
