{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      make
      nix
      cpp
      c
      python
      yaml
      markdown
    ];
    folding = true;
    nixGrammars = true;
    nixvimInjections = true;
  };
}
