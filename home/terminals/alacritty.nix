{ pkgs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    import = [ pkgs.alacritty-theme.catppuccin_latte];
    font = {
      size = 12;
      normal = {
        family = "CodeNewRoman Nerd Font";
        style = "Regular";
      };
    };
  };
}
