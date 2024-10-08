{ lib, pkgs, ... }:
let
  unfree = with pkgs;[
    google-chrome
  ];
  free = with pkgs;[
    fastfetch
    fzf
    ripgrep
    htop
    nodejs
    python3
    clash-meta
    gnumake
    cmake
    gcc
    rustup
    libnotify
    xdg-utils
    dunst
    udiskie
    blueman
  ];
  fonts = with pkgs;[
    wqy_zenhei
    fira-code-nerdfont
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
  ];
in
{
  home.packages = unfree ++ free ++ fonts;
  fonts.fontconfig.enable = true;
  services = {
    udiskie.enable = true; # auto mount usb device
  };
}
