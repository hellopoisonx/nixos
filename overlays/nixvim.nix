{
  inputs,
  system,
  pkgs,
  lib,
  ...
}:
self: super: {
  nixvim = inputs.nixvim.packages.${system}.default.extend {
    plugins.lsp.servers.bashls.enable = true;
    plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      xml
      yaml
      toml
      regex
      nix
      markdown
      make
      lua
      vim
      vimdoc
    ];
    plugins.conform-nvim.settings = {
      formatters_by_ft = {
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
      };
      formatters = {
        shellcheck = {
          command = lib.getExe pkgs.shellcheck;
        };
        shfmt = {
          command = lib.getExe pkgs.shfmt;
        };
        shellharden = {
          command = lib.getExe pkgs.shellharden;
        };
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
      };
    };
  };
}
