{ pkgs, ... }:
with pkgs;
[
  wqy_zenhei
  (nerdfonts.override {
    fonts = [
      "CodeNewRoman"
    ];
  })
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  liberation_ttf
  lxgw-wenkai
]
