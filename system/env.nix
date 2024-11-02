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
    xf86_input_wacom
    libwacom
    xorg.libxcb.dev
  ];
  environment.pathsToLink = [ "/share/zsh" ];
}
