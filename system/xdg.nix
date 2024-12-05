{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-xapp
        xdg-desktop-portal
      ];
      config = {
        common.default = "*";
        i3.default = [
          "xapp"
        ];
        xfce.default = [ "xapp" ];
      };
    };
  };
}
