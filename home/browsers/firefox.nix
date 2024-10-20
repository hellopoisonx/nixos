{ lib, pkgs, ... }:
let
  exec = lib.getExe' pkgs.firefox "firefox";
in
{
  programs.firefox.enable = true;

  home.file.".local/share/applications/youdao.desktop".text = import ./youdao.nix exec;
}
