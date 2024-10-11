{ pkgs, config, ... }:
{
  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  services.displayManager = {
    defaultSession = "none+i3";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver = {
    xkb.layout = "us";
    xkb.options = "eurosign:e,caps:escape";
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
    desktopManager.runXdgAutostartIfNone = true;
  };

  services.udisks2.enable = true;
}
