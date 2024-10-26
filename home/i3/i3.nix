{
  config,
  lib,
  pkgs,
  ...
}:
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
      startup = [
        # {
        #   command = "dunst &";
        #   notification = false;
        # }
      ];
      terminal = "alacritty";
      window.titlebar = false;
      bars = [
        {
          fonts = {
            names = [
              "CodeNewRoman Nerd Font Mono"
              "LXGW WenKai Mono"
            ];
            style = "Bold";
            size = 11.0;
          };
          extraConfig = "output DP-2";
          statusCommand = "i3blocks -c ~/.config/i3blocks/top";
          position = "top";
          trayOutput = "DP-2";
          trayPadding = 2;
        }
      ];
      keybindings =
        let
          mod = config.xsession.windowManager.i3.config.modifier;
        in
        lib.mkOptionDefault {
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";

          "XF86MonBrightnessUp" = "exec --no-startup-id light -A 5";
          "XF86MonBrightnessDown" = "exec --no-startup-id light -U 5";

          "${mod}+Shift+a" = "focus child";

          "${mod}+d" = "exec --no-startup-id rofi -show drun -show-icons";

          "${mod}+g" = "split horizontal";

          "${mod}+p" = "exec ${lib.getExe' pkgs.flameshot "flameshot"} gui";
        };
    };
    extraConfig = ''
      mode "resize" {
              # These bindings trigger as soon as you enter the resize mode

              # Pressing left will shrink the window’s width.
              # Pressing right will grow the window’s width.
              # Pressing up will shrink the window’s height.
              # Pressing down will grow the window’s height.
              bindsym h resize shrink width 10 px or 10 ppt
              bindsym l resize grow height 10 px or 10 ppt
              bindsym k resize shrink height 10 px or 10 ppt
              bindsym j resize grow width 10 px or 10 ppt

              # same bindings, but for the arrow keys
              bindsym Left resize shrink width 10 px or 10 ppt
              bindsym Down resize grow height 10 px or 10 ppt
              bindsym Up resize shrink height 10 px or 10 ppt
              bindsym Right resize grow width 10 px or 10 ppt

              # back to normal: Enter or Escape or Mod4+r
              bindsym Return mode "default"
              bindsym Escape mode "default"
              bindsym Mod4+r mode "default"
      }


      for_window [class="wemeetapp"] floating enable
      for_window [class="com.alibabainc.dingtalk"] floating enable
      for_window [class="ts-polkitagent"] floating enable
      for_window [class="ets.exe"] floating enable
      for_window [title="Color Picker"] floating enable
      for_window [class="Blueman-manager"] floating enable for_window [class="Clash_flutter"] floating enable
      for_window [class="Emulator"] floating enable
      for_window [class="VirtualBox Machine"] floating enable
      for_window [title="timeshift-gtk"] floating enable
      for_window [class="pavucontrol"] floating enable

      default_border 3
      default_floating_border none

      # class                 border  bground text    indicator child_border
      client.focused          #3D2BB5 #091C77 #FFFFFF #36BEF4   #285577
      client.focused_inactive #333333 #5F676A #FFFFFF #484E50   #5F676A
      client.unfocused        #333333 #222222 #888888 #292D2E   #222222
      client.urgent           #2F343A #900000 #FFFFFF #900000   #900000
      client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C

      client.background       #FFFFFF
    '';
  };
}
