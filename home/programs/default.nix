{ config, ... }: {
  imports = [
    ./git.nix
    ./applications.nix
  ];
}
