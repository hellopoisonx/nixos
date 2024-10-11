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
  fonts = import ../fonts/fonts_list.nix pkgs;
in
{
  home.packages = unfree ++ free ++ fonts;
}
