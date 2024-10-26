{ inputs, ... }:
{
  nixpkgs.overlays = with inputs; [
    alacritty-theme.overlays.default
    (import ./xournalpp.nix)
  ];
}
