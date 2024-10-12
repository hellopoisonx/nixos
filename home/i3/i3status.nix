{ ... }:
{
  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      output_format = "i3bar";
      interval = 1;
    };
    modules = {
      "volume master" = {
        position = 1;
        settings = {
          format = " %volume";
          format_muted = " muted";
          device = "pulse:1";
        };
      };
      "disk /" = {
        position = 2;
        settings = {
          format = "/ %free";
        };
      };
      "memory" = {
        position = 3;
        settings = {
          format = "%used";
          threshold_degraded = "10%";
          format_degraded = " %free";
        };
      };
      "cpu_usage" = {
        position = 4;
        settings = {
          format = " %usage";
        };
      };
    };
  };
}
