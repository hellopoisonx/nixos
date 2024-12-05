{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "CodeNewRoman Nerd Font Mono";
      package = pkgs.nerd-fonts.code-new-roman;
      size = 13;
      shellIntegration.enableZshIntegration = true;
    };
  };
}
