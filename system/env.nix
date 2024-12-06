{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    unzip
    p7zip
    zip
    git
    nixfmt-rfc-style
    libwacom
    shfmt
    shellharden
    coreutils
  ];
  environment.pathsToLink = [ "/share/zsh" ];
}
