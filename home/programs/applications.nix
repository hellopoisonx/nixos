{ pkgs, ... }:
let
  code = import ../code; 
  fonts = import ../fonts/fonts_list.nix pkgs;
  unfree = with pkgs; [
    wpsoffice-cn
    qq
  ];
  free = with pkgs; [
    nixvim
    xournalpp
    wine
    winetricks
    fontforge-gtk
    telegram-desktop
    fastfetch
    fzf
    jq
    ripgrep
    htop
    clash-meta
    libnotify
    xdg-utils
    udiskie
    blueman
  ];
in
{
  home.packages = unfree ++ free ++ fonts ++ code;
}
