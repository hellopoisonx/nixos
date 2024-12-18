{ ... }:

{
  imports = [
    ./bootloader.nix
    ./env.nix
    ./network.nix
    ./nix-configuration.nix
    ./hardware.nix
    ./services.nix
    ./zsh.nix
    ./xdg.nix
    ./virt.nix
    ./fcitx5.nix
    ./hardware-configuration.nix
  ];

  programs.nix-ld.enable = true;
  programs.adb.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";

  users.users.hpxx = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "light"
      "libvirtd"
      "adbusers"
    ];
  };

  system.copySystemConfiguration = false; # not supported by flake
  system.stateVersion = "24.11";
}
