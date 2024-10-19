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
    extraConfigLua = ''
      require('mini.indentscope').setup()
    '';
    colorscheme = "tokyonight-storm";
  };
}
