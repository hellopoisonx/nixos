{ ... }:
{
  services.polybar = {
    enable = false; # use i3bar instead
    script = "pkill polybar;polybar top &";

    extraConfig = ''
      ;==========================================================
      ;
      ;
      ;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
      ;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
      ;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
      ;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
      ;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
      ;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
      ;
      ;
      ;   To learn more about how to configure Polybar
      ;   go to https://github.com/polybar/polybar
      ;
      ;   The README contains a lot of information
      ;
      ;==========================================================

      [colors]
      background = #282A2E
      background-alt = #373B41
      foreground = #C5C8C6
      primary = #F0C674
      secondary = #8ABEB7
      alert = #A54242
      disabled = #707880

      [bar/top]
      width = 100%
      height = 24pt
      radius = 10

      ; dpi = 96

      background = ''${colors.background}
      foreground = ''${colors.foreground}

      line-size = 3pt

      border-size = 4pt
      border-color = #00000000

      padding-left = 0
      padding-right = 2

      module-margin = 1

      separator = |
      separator-foreground = ''${colors.disabled}

      font-0 = CodeNewRoman Nerd Font Mono;4
      font-1 = LXGW WenKai Mono;2

      modules-left = i3 systray xwindow
      modules-center = date network
      modules-right = backlight pulseaudio xkeyboard memory cpu wlan

      cursor-click = pointer
      cursor-scroll = ns-resize

      enable-ipc = true

      scroll-up = "#i3.prev"
      scroll-down = "#i3.next"
      ; wm-restack = generic
      ; wm-restack = bspwm
      ; wm-restack = i3

      ; override-redirect = true

      ; This module is not active by default (to enable it, add it to one of the
      ; modules-* list above).
      ; Please note that only a single tray can exist at any time. If you launch
      ; multiple bars with this module, only a single one will show it, the others
      ; will produce a warning. Which bar gets the module is timing dependent and can
      ; be quite random.
      ; For more information, see the documentation page for this module:
      ; https://polybar.readthedocs.io/en/stable/user/modules/tray.html
      [module/i3]
      type = internal/i3

      ; Only show workspaces defined on the same output as the bar
      ;
      ; Useful if you want to show monitor specific workspaces
      ; on different bars
      ;
      ; Default: false
      pin-workspaces = true

      ; Show urgent workspaces regardless of whether the workspace is actually hidden 
      ; by pin-workspaces.
      ;
      ; Default: false
      ; New in version 3.6.0
      show-urgent = true

      ; This will split the workspace name on ':'
      ; Default: false
      strip-wsnumbers = true

      ; Sort the workspaces by index instead of the default
      ; sorting that groups the workspaces by output
      ; Default: false
      index-sort = true

      ; Create click handler used to focus workspace
      ; Default: true
      enable-click = false

      ; Create scroll handlers used to cycle workspaces
      ; Default: true
      enable-scroll = false

      ; Wrap around when reaching the first/last workspace
      ; Default: true
      wrapping-scroll = false

      ; Set the scroll cycle direction 
      ; Default: true
      reverse-scroll = false

      ; Use fuzzy (partial) matching for wc-icon.
      ; Example: code;♚ will apply the icon to all workspaces 
      ; containing 'code' in the name
      ; Changed in version 3.7.0: Selects longest string match instead of the first match.
      ; Default: false
      fuzzy-match = true

      ; Available tags:
      ;   <label-state> (default) - gets replaced with <label-(focused|unfocused|visible|urgent)>
      ;   <label-mode> (default)
      format = <label-state> <label-mode>

      ; Available tokens:
      ;   %mode%
      ; Default: %mode%
      label-mode = %mode%
      label-mode-padding = 1
      label-mode-background = #e60053

      ; Available tokens:
      ;   %name%
      ;   %icon%
      ;   %index%
      ;   %output%
      ; Default: %icon% %name%
      label-focused = %index%
      label-focused-foreground = #ffffff
      label-focused-background = #3f3f3f
      label-focused-underline = #fba922
      label-focused-padding = 2

      ; Available tokens:
      ;   %name%
      ;   %icon%
      ;   %index%
      ;   %output%
      ; Default: %icon% %name%
      label-unfocused = %index%
      label-unfocused-padding = 1

      ; Available tokens:
      ;   %name%
      ;   %icon%
      ;   %index%
      ;   %output%
      ; Default: %icon% %name%
      label-visible = %index%
      label-visible-underline = #555555
      label-visible-padding = 1

      ; Available tokens:
      ;   %name%
      ;   %icon%
      ;   %index%
      ;   %output%
      ; Default: %icon% %name%
      label-urgent = %index%
      label-urgent-foreground = #000000
      label-urgent-background = #bd2c40
      label-urgent-padding = 1

      ; Separator in between workspaces
      label-separator = |
      label-separator-padding = 1
      label-separator-foreground = #ffb52a

      [module/systray]
      type = internal/tray

      format-margin = 2pt
      tray-spacing = 8pt

      [module/backlight]
      type = internal/backlight

      ; Use the following command to list available cards:
      ; ''$ ls -1 /sys/class/backlight/
      ; Default: first usable card in /sys/class/backlight (new in version 3.7.0)
      card = acpi_video0

      ; Use the `/sys/class/backlight/.../actual-brightness` file
      ; rather than the regular `brightness` file.
      ; New in version 3.6.0
      ; Changed in version: 3.7.0: Defaults to true also on amdgpu backlights
      ; Default: true
      use-actual-brightness = true

      ; Interval in seconds after which after which the current brightness is read
      ; (even if no update is detected).
      ; Use this as a fallback if brightness updates are not registering in polybar
      ; (which happens if the use-actual-brightness is false).
      ; There is no guarantee on the precisio of this timing.
      ; Set to 0 to turn off
      ; New in version 3.7.0
      ; Default: 0 (5 if use-actual-brightness is false)
      poll-interval = 0

      ; Enable changing the backlight with the scroll wheel
      ; NOTE: This may require additional configuration on some systems. Polybar will
      ; write to `/sys/class/backlight/''${self.card}/brightness` which requires polybar
      ; to have write access to that file.
      ; DO NOT RUN POLYBAR AS ROOT. 
      ; The recommended way is to add the user to the
      ; `video` group and give that group write-privileges for the `brightness` file.
      ; See the ArchWiki for more information:
      ; https://wiki.archlinux.org/index.php/Backlight#ACPI
      ; Default: false
      enable-scroll = true

      ; Interval for changing the brightness (in percentage points).
      ; New in version 3.7.0
      ; Default: 5
      scroll-interval = 10

      format = <label>
      format-prefix = "LIG "
      format-prefix-foreground = ''${colors.primary}
      label = %percentage%%

      [module/xwindow]
      type = internal/xwindow
      label = %title:0:60:...%

      [module/pulseaudio]
      type = internal/pulseaudio

      format-volume-prefix = "VOL "
      format-volume-prefix-foreground = ''${colors.primary}
      format-volume = <label-volume>

      label-volume = %percentage%%

      label-muted = muted
      label-muted-foreground = ''${colors.disabled}

      [module/xkeyboard]
      type = internal/xkeyboard
      blacklist-0 = num lock

      label-layout = %layout%
      label-layout-foreground = ''${colors.primary}

      label-indicator-padding = 2
      label-indicator-margin = 1
      label-indicator-foreground = ''${colors.background}
      label-indicator-background = ''${colors.secondary}

      [module/memory]
      type = internal/memory
      interval = 2
      format-prefix = "RAM "
      format-prefix-foreground = ''${colors.primary}
      label = %percentage_used:2%%

      [module/cpu]
      type = internal/cpu
      interval = 2
      format-prefix = "CPU "
      format-prefix-foreground = ''${colors.primary}
      label = %percentage:2%%

      [network-base]
      type = internal/network
      interval = 5
      format-connected = <label-connected>
      format-disconnected = <label-disconnected>
      label-disconnected = %{F#F0C674}%ifname%%{F#707880} disconnected

      [module/wlan]
      inherit = network-base
      interface-type = wireless
      format = <label>
      label-connected = %essid% %local_ip%

      [module/network]
      type = internal/network
      interface = wlp3s0
      interval = 1.0
      label-connected = "  %downspeed%  %upspeed%  "
      label-disconnected = disconnected

      [module/date]
      type = internal/date
      interval = 1

      date = %H:%M
      date-alt = %Y-%m-%d %H:%M:%S

      label = %date%
      label-foreground = ''${colors.primary}

      [settings]
      screenchange-reload = true
      pseudo-transparency = true

      ; vim:ft=dosini
    '';
  };
}
