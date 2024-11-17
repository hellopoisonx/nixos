{ pkgs, ... }:
{
  programs.alacritty.enable = false;
  # programs.alacritty.settings = {
  #   general.import = [ pkgs.alacritty-theme.catppuccin ];
  #   font = {
  #     size = 12;
  #     normal = {
  #       family = "CodeNewRoman Nerd Font";
  #       style = "Regular";
  #     };
  #   };
  # };
}
