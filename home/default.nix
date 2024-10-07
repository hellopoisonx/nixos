{ config
, ...
}: {
  imports = [
    ./home.nix
    ./nixvim
    ./shell
    ./programs
    ./ssh/ssh.nix
  ];
}
