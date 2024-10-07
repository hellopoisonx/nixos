{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 10;
        outer = 10;
      };
      terminal = "alacritty";
      startup = {
        dunst = {
          command = "dunst &";
        };
      };
      window.titlebar = false;
    };
  };
}
