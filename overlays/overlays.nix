{ inputs, ... }:
{
  nixpkgs.overlays = with inputs; [
    alacritty-theme.overlays.default
    (import ./xournalpp.nix)
    (import ./nixvim.nix inputs.nixvim-conf)
  ];
}
