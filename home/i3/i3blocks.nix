{
  config,
  lib,
  pkgs,
  ...
}:
let
  luaPath = lib.getExe' pkgs.lua5_4 "lua";
  scriptsPath = "${config.home.homeDirectory}/.config/i3blocks-scripts";
  lua = ''LUA_PATH="$LUA_PATH;${scriptsPath}/?.lua;;" ${luaPath}'';
in
{
  home.file.".config/i3blocks-scripts" = {
    recursive = true;
    source = ./i3block_scripts;
  };
  programs.i3blocks = {
    enable = true;
    bars = {
      top = {
        light = {
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
