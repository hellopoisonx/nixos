{
  inputs,
  pkgs,
  system,
  ...
}:
let
  nur = import inputs.nur {
    nurpkgs = import inputs.nixpkgs { inherit system; };
    inherit pkgs;
  };
  code = import ../code pkgs;
  fonts = import ../fonts/fonts_list.nix pkgs;
  unfree = with pkgs; [
    wpsoffice-cn
    qq
    # nur.repos.xddxdd.dingtalk
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
