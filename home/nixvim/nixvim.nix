{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    extraPlugins = with pkgs; [
      vimPlugins.tokyonight-nvim
      vimPlugins.mini-indentscope
    ];
    colorscheme = "tokyonight-storm";
  };
}
