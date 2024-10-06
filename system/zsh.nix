{ pkgs, ... }: {
  environment.shells = with pkgs; [ zsh ];
  users.users.hpxx.shell = pkgs.zsh;
}
