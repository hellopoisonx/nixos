{
  config,
  lib,
  pkgs,
  ...
}:
let
  luaPkg = import ../code/lua/lua.nix pkgs;
  luaPath = lib.getExe' (builtins.head luaPkg) "lua";
  scriptsPath = "${config.home.homeDirectory}/.config/i3block-scripts";
  lua = ''LUA_PATH="$LUA_PATH;${scriptsPath}/?.lua;;" ${luaPath}'';
in
{
  home.file.".config/i3block-scripts" = {
    recursive = true;
    source = ./i3block_scripts;
  };
  programs.i3blocks = {
    enable = true;
    bars = {
      top = {
        traffic = {
          command = "${lua} ${scriptsPath}/traffic.lua";
          align = "center";
          min_width = 150;
          interval = 1;
        };
        cpu = lib.hm.dag.entryAfter [ "traffic" ] {
          command = "${lua} ${scriptsPath}/cpu.lua";
          align = "center";
          min_width = 70;
          interval = "repeat";
        };
        light = lib.hm.dag.entryAfter [ "cpu" ] {
          command = "${lua} ${scriptsPath}/light.lua";
          align = "center";
          min_width = 70;
          interval = "repeat";
        };
        volume = lib.hm.dag.entryAfter [ "light" ] {
          command = "${lua} ${scriptsPath}/volume.lua";
          align = "center";
          min_width = 70;
          interval = "repeat";
        };
        time = lib.hm.dag.entryAfter [ "volume" ] {
          command = "date +\"%Y/%m/%d %H:%M:%S\"";
          align = "center";
          interval = 1;
        };
      };
    };
  };
}
