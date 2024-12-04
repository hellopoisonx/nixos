{
  inputs,
  system,
  pkgs,
  lib,
  ...
}:
self: super: {
  nixvim = inputs.nixvim.packages.${system}.default.extend {
    plugins.lsp.servers = {
      nixd.enable = true;
      lua_ls.enable = true;
      bashls.enable = true;
      bashls.filetypes = [
        "bash"
        "sh"
        "zsh"
      ];
    };
    plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      json
      xml
      yaml
      toml
      regex
      markdown
      make
    ];
    plugins.conform-nvim.settings = {
      formatters_by_ft = {
        zsh = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        lua = [ "stylua" ];
        "nix" = [ "nixfmt" ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
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
        nixfmt = {
          command = lib.getExe' pkgs.nixfmt-rfc-style "nixfmt";
        };
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
      };
    };
  };
}
