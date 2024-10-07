{ config
, ...
}: {
  imports = [
    ./home.nix
    ./nixvim
    ./shell
    ./programs
    ./ssh/ssh.nix
    ./i3/i3.nix
  ];
}
