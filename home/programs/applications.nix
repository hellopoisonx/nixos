{ pkgs, ... }:
let
  unfree = with pkgs; [
    # inputs.browser-previews.packages.${pkgs.system}.google-chrome-dev # cause rendering problem don't know why
    wpsoffice-cn
    qq
  ];
  free = with pkgs; [
    wine
    winetricks
    fontforge-gtk
    telegram-desktop
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
    lua5_4
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
