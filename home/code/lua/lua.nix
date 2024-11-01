pkgs: with pkgs; [
  (lua5_3.withPackages (
    ps: with ps; [
      lua-cjson
      http
    ]
  ))
  lua-language-server
]
