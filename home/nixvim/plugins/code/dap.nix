{ pkgs, lib, ... }:
{
  programs.nixvim.plugins.dap = {
    enable = true;
    adapters = {
      servers = {
        codelldb = {
          port = "\${port}";
          executable = {
            args = [
              "--port"
              "\${port}"
            ];
            command = lib.getExe pkgs.codelldb;
          };
        };
      };
      configurations = {
        cpp = {
          "launch file" = {
            name = "Launch file";
            type = "codelldb";
            request = "launch";
          };
        };
      };
    };
  };
}
