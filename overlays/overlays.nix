{
  inputs,
  lib,
  pkgs,
  system,
  ...
}:
{
  nixpkgs.overlays = [
    (import ./xournalpp.nix)
    (import ./nixvim.nix {
      inherit lib;
      inherit pkgs;
      inherit inputs;
      inherit system;
    })
    # inputs.nur.overlay
  ];
}
