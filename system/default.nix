{ ... }:

{
  imports = [
    ./env.nix
    ./network.nix
    ./nix-configuration.nix
    ./services.nix
    ./zsh.nix
  ];

  programs.nix-ld.enable = true;
  programs.adb.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";

  users.users.hpxx = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "adbusers"
    ];
  };

  system.copySystemConfiguration = false; # not supported by flake
  system.stateVersion = "25.05";
}
