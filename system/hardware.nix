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
    package = pkgs.linuxPackages.nvidia_x11_legacy390;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.bluetooth.enable = true;

  boot.kernelPackages = pkgs.linuxPackages;

  boot.extraModprobeConfig = ''
    options snd-hda-intel model=imac27_122
  '';
}
