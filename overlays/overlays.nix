{ inputs, ... }:
{
  nixpkgs.overlays = with inputs; [
    alacritty-theme.overlays.default
    neovim-nightly-overlay.overlays.default
  ];
}
