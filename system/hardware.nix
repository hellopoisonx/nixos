{ config, ... }:
{
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
}
