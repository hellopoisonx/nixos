{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      ns = "sudo nixos-rebuild switch";
      nd = "nix develop";
    };

    plugins."powerlevel10k" = {
      name = "zsh-powerlevel10k";
      src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
      file = "powerlevel10k.zsh-theme";
    };

    # oh-my-zsh = {
    #   enable = false;
    #   plugins = [ "git" ];
    #   theme = "robbyrussell";
    # };
  };
}
