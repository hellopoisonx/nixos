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

    plugins = [
      {
        name = "p10k-conf";
        file = "p10k-conf.zsh";
        src = ./.;
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    sessionVariables = {
      GLFW_IM_MODULE = "ibus";
    };

    # oh-my-zsh = {
    #   enable = false;
    #   plugins = [ "git" ];
    #   theme = "robbyrussell";
    # };
  };
}
