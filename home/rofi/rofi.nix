{ lib, pkgs, ... }:
{
  programs.rofi = {
    enable = false;
    font = "CodeNewRoman Nerd Font";
    cycle = true;
    location = "top";
    yoffset = 0;
    terminal = "${lib.getExe' pkgs.kitty "kitty"}";
  };
}
