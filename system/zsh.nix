{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableLsColors = true;
    shellInit = "eval $(starship init zsh)";
  };
}
