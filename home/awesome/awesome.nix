{ pkgs, ... }:
{
  xsession.windowManager.awesome = {
    enable = false;
    luaModules = with pkgs.luaPackages; [
      luarocks
      vicious
    ];
  };
}
