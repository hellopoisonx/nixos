{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.alacritty-theme.overlays.default
    (import ./xournalpp.nix)
  ];
}
