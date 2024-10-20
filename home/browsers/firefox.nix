{ lib, pkgs, ... }:
let
  exec = lib.getExe' pkgs.firefox "firefox";
in
{
  programs.firefox.enable = true;
  programs.firefox.languagePacks= ["zh_CN"];

  home.file.".local/share/applications/youdao.desktop".text =
    import ./shortcut.nix exec "http://youdao.com"
      "youdao";

  home.file.".local/share/applications/metacubexd.desktop".text =
    import ./shortcut.nix exec "https://metacubexd.pages.dev/"
      "metacubexd";
}
