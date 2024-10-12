{ ... }:
{
  imports = [
    ./home.nix
    ./nixvim
    ./shell
    ./programs
    ./ssh/ssh.nix
    ./i3
    ./fcitx/fcitx.nix
    ./polybar/polybar.nix # use i3bar instead
    ./udiskie/udiskie.nix
    ./fonts/fonts.nix
    ./flameshot/flameshot.nix
    ./xdg/xdg.nix
    # ./clash-meta/clash-meta.nix
  ];
}
