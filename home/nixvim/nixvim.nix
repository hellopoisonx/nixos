{ nixvim-conf, ... }:
{
  imports = [ nixvim-conf ];
  lspServer = {
    clangd.enable = true;
    cmake.enable = true;
  };
  conform.formatters_by_ft = {
    cmake = [ "cmake" ];

    c = [ "clangd-format" ];
    cpp = [ "clangd-format" ];
    cc = [ "clangd-format" ];
    hpp = [ "clangd-format" ];
    h = [ "clangd-format" ];

  };
}
