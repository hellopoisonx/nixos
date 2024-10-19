{ ... }:
{
  # home.file.".ssh/github".source = ../../protect/github_hellopoisonx;
  # home.file.".ssh/github.pub".source = ../../protect/github_hellopoisonx.pub;
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
