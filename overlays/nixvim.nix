{nixvim-conf,...}:
final: prev: {
  nixvim = nixvim-conf.packages.${prev.system}.default;
}
