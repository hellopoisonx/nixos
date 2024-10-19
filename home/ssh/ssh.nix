{ ... }:
{
  imports = [
    # protect
    ../../../nixos-protect/ssh.nix
    #
  ];
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        port = 22;
        host = "github.com";
        hostname = "github.com";
        identityFile = [ "~/.ssh/github" ];
      };
    };
  };
}
