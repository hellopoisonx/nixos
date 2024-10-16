{ pkgs, ... }:
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
      extraPackages = with pkgs; [
        i3status
        i3blocks
      ];
    };
    desktopManager.runXdgAutostartIfNone = true;
  };

  services.udisks2.enable = true;

  systemd.services.clash-meta = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "Clash.Meta";
    serviceConfig = {
      Type = "simple";
      User = "root";
      ExecStart = "${pkgs.clash-meta}/bin/clash-meta -d /etc/clash-meta";
    };
  };

  services.flatpak.enable = true;
}
