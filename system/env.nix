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
    xfce.xfce4-docklike-plugin
    efibootmgr
    refind
    grub2
    shfmt
    shellharden
    coreutils
  ];
  environment.pathsToLink = [ "/share/zsh" ];
}
