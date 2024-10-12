{ config, pkgs, ... }:
{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-chinese-addons
        fcitx5-nord
        fcitx5-gtk
      ];
    };
  };
  home.file.".config/fcitx5/conf/classicui.conf".text = ''
    Theme=Nord-Dark
  '';
}
