{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./autocmd.nix
    ./plugins
  ];
}
