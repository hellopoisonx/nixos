{ lib, ... }:
{
  programs.i3blocks = {
    enable = true;
    bars = {
      top = {
        time = {
          command = "date \"+%Y.%d.%M %H:%M:%S\"";
          align = "center";
          interval = 1;
        };
      };
    };
  };
}
