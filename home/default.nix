{ ... }:
{
  imports = [
    ./home.nix
    ./shell
    ./programs
    ./ssh/ssh.nix
    ./fonts/fonts.nix
  ];
}
