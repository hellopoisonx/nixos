{ config
, ...
}: {
  imports = [
    ./home.nix
    ./shell
    ./programs
  ];
}
