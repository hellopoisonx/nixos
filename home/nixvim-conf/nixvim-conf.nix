{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixvim-conf ];
  nixvim-conf = {
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.builtGrammars.elixir;
    languageRegister = {
      elixir = [
        "ex"
        "exs"
      ];
    };
    servers = {
      elixirls.enable = true;
    };
    formatters_by_ft = {
      elixir = [ "mix" ];
    };
  };
}
