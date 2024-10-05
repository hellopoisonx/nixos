{ config, lib, pkgs, ... }:

{
  home.username = "hpxx";
  home.homeDirectory = "/home/hpxx";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 2;
        outer = 2;
      };
      keybindings = lib.mkOptionDefault {
        "Mod4+Return" = "exec alacritty";
      };
    };
  };
}

