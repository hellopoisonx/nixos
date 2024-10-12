{ pkgs, ... }:
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
    nixfmt-rfc-style
  ];
  environment.pathsToLink = [ "/share/zsh" ];
}
