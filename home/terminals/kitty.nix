{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
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
    themeFile = "catppuccin_mocha";
    settings = {
      symbol_map = "U+4E00-U+62FF,U+6300-U+77FF,U+7800-U+8CFF,U+8D00-U+9FFF LXGW WenKai Mono";
      enable_audio_bell = false;
    };
  };
}
