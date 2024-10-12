{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/EFI"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
    };
  };
}
