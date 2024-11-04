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
    nur.repos.novel2430.wemeet-bin-bwrap
    nur.repos.novel2430.wechat-universal-bwrap
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
