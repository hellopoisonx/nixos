{
  inputs,
  pkgs,
  system,
  ...
}:
let
  my-nur = inputs.my-nur.packages.${system};
  code = import ../code pkgs;
  fonts = import ../fonts/fonts_list.nix pkgs;
  unfree = with pkgs; [
    wpsoffice-cn
    qq
    my-nur.wemeet
    my-nur.mihomo-party
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
    youtube-music
    scrcpy
    localsend
    nixvim
  ];
in
{
  home.packages = unfree ++ free ++ fonts ++ code;
}
