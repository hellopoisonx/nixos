{ inputs, ... }:
{
  nixpkgs.overlays = [
    (import ./xournalpp.nix)
    inputs.nur.overlay
  ];
}
