{
  nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = false;
  nixpkgs.config.nvidia.acceptLicense = true;
  # nixpkgs.config.permittedInsecurePackages = [
  #   "openssl-1.1.1w"
  # ];
  # nixpkgs.config.allowUnsupportedSystem = true;
}
