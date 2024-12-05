{ ... }:
{
  home.username = "hpxx";
  home.homeDirectory = "/home/hpxx";
  home.stateVersion = "24.11";
  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7890";
    http_proxy = "http://127.0.0.1:7890";
    all_proxy = "http://127.0.0.1:7890";
    GLFW_IM_MODULE = "ibus";
    EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
