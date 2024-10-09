{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./bootloader.nix
      ./env.nix
      ./network.nix
      ./nix-configuration.nix
      ./hardware-configuration.nix
      ./services.nix
      ./zsh.nix
    ];

  programs.nix-ld.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";

  users.users.hpxx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio"];
  };

  system.copySystemConfiguration = false; # not supported by flake
  system.stateVersion = "24.05";
}

