pkgs: with pkgs; [
  pyright
  (python3.withPackages (
    p: with p; [
      autopep8
    ]
  ))
]
