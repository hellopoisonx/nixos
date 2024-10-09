{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    unzip
    p7zip
    zip
    git
    pulseaudio
    light
  ];
  environment.pathsToLink = [ "/share/zsh" ];
}
