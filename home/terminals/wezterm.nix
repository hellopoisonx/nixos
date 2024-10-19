{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        font = wezterm.font("CodeNewRoman Nerd Font")
        font_size = 13.0
      }
    '';
  };
}
