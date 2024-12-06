{
  inputs,
  lib,
  pkgs,
  system,
  ...
}:
{
  nixpkgs.overlays = [
    (import ./nixvim.nix {
      inherit lib;
      inherit pkgs;
      inherit inputs;
      inherit system;
    })
  ];
}
