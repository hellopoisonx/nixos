{ ... }:
{
  imports = [
    ./home.nix
    ./shell
    ./programs
    ./ssh/ssh.nix
    ./i3
    ./terminals
    ./udiskie/udiskie.nix
    ./fonts/fonts.nix
    ./flameshot/flameshot.nix
    ./rofi/rofi.nix
    ./browsers/firefox.nix
    ./nixvim/nixvim.nix
  ];
}
