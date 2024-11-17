{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-xapp
      ];
      config = {
        common.default = "*";
        i3.default = [
          "xapp"
        ];
        xfce.default = [ "kde" ];
      };
    };
  };
}
