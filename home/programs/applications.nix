{ lib, pkgs, ... }:
let
  unfree = with pkgs;[
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
  ];
  fonts = with pkgs;[
  ];
in
{
  home.packages = unfree ++ free ++ fonts;
}
