{ pkgs, ... }:
let
  code = import ../code pkgs; 
  fonts = import ../fonts/fonts_list.nix pkgs;
  unfree = with pkgs; [
    wpsoffice-cn
    qq
  ];
  free = with pkgs; [
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
    lemonbar
    xdotool
    playerctl
  ];
in
{
  home.packages = unfree ++ free ++ fonts ++ code;
}
