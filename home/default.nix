{ ... }:
{
  imports = [
    ./home.nix
    ./shell
    ./programs
    ./ssh/ssh.nix
    ./i3
    ./terminals
    ./polybar/polybar.nix # use i3bar instead
    ./udiskie/udiskie.nix
    ./fonts/fonts.nix
    ./flameshot/flameshot.nix
    ./rofi/rofi.nix
    ./browsers/firefox.nix
  ];
}
