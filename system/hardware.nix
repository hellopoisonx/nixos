{ pkgs, ... }:
{
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    modesetting.enable = true;
    package = pkgs.linuxPackages_latest.nvidia_x11_legacy390;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.extraModprobeConfig = ''
    options snd-hda-intel model=imac27_122
  '';
}
