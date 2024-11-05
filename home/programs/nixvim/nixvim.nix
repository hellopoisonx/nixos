{ nixvim, system, ... }:
let
  conf = {
    plugins.lsp.servers = {
      clangd.enable = true;
      cmake.enable = true;
    };
    plugins.conform-nvim.settings.formatters_by_ft = {
      cmake = [ "cmake" ];

      c = [ "clangd-format" ];
      cpp = [ "clangd-format" ];
      cc = [ "clangd-format" ];
      hpp = [ "clangd-format" ];
      h = [ "clangd-format" ];
    };
  };
in
nixvim.packages.${system}.default.extend conf
