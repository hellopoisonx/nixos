{
  programs.neovide = {
    enable = false; # nixos-unstable `cctool` error: `https://nixpk.gs/pr-tracker.html?pr=356292`
    settings = {
      vsync = false;
      font = {
        normal = [
          "CodeNewRoman Nerd Font Mono"
        ];
        size = 12.0;
      };
    };
  };
}
