{ config
, ...
}: {
  imports = [
    ./home.nix
    ./shell
    ./programs
    ./ssh/ssh.nix
  ];
}
