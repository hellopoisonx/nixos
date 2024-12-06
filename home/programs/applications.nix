{
  pkgs,
  ...
}:
let
  code = import ../code pkgs;
  fonts = import ../fonts/fonts_list.nix pkgs;
  free = with pkgs; [
    fastfetch
    fzf
    jq
    ripgrep
    htop
    scrcpy
    nixvim
  ];
in
{
  home.packages = free ++ fonts ++ code;
}
