{ config, ... }:
{
  imports = [
    ./git.nix
    ./applications.nix
    ./alacritty.nix
  ];
}
