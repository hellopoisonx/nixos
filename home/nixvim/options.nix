{ pkgs, ... }:
let
  p = import ./plugins/extraPlugins.nix pkgs;
  extraPlugins = p.p;
  extraConf = p.config;
in
{
  # hm specified
  programs.nixvim.enable = true;
  programs.nixvim.defaultEditor = true;
  programs.nixvim.vimdiffAlias = true;
  #

  programs.nixvim.performance.combinePlugins.enable = true;
  programs.nixvim.vimAlias = true;
  programs.nixvim.viAlias = true;
  programs.nixvim.luaLoader.enable = true;
  programs.nixvim.clipboard = {
    register = "unnamedplus";
    providers.xclip.enable = true;
  };
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    ignorecase = true;
    smartcase = true;
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;
    expandtab = true;
    smarttab = true;
    cursorline = true;
    ruler = true;
    timeoutlen = 300;
  };

  programs.nixvim.extraPlugins = extraPlugins;
  programs.nixvim.extraConfigLua =
    ''
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    ''
    + extraConf;
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.colorschemes.catppuccin.enable = true;
}
