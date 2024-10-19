{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-kde
      ];
      config = {
        common.default = "*";
        i3.default = [
          "gtk"
          "kde"
        ];
        kde.default = [ "kde" ];
      };
    };
  };
}
