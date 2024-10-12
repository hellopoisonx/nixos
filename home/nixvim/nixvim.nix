{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    extraPlugins = [ pkgs.vimPlugins.tokyonight-nvim ];
    colorscheme = "tokyonight-storm";
  };
}
