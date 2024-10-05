{ lib, pkgs, ... }:
let
  unfree = with pkgs;[
    google-chrome
  ];
  free = with pkgs;[
    fastfetch
    alacritty
    mpv
    neovim
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
  ];
in
{
  home.packages = unfree ++ free;
  services = {
    udiskie.enable = true; # auto mount usb device
  };
}
