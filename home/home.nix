{ config, lib, pkgs, ... }:
{
  home.username = "hpxx";
  home.homeDirectory = "/home/hpxx";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}

