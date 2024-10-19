{ pkgs, ... }:
{
  programs.kitty = {
    enable = false;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "CodeNewRoman Nerd Font";
      package = (
        pkgs.nerdfonts.override {
          fonts = [ "CodeNewRoman" ];
        }
      );
      size = 12;
    };
    # themeFile = "tokyo_night_storm";
    settings = {
      symbol_map = "U+4E00-U+62FF,U+6300-U+77FF,U+7800-U+8CFF,U+8D00-U+9FFF LXGW WenKai Mono";
    };
    environment = {
      # "GLFW_IM_MODULE" = "ibus";
    };
  };
}
