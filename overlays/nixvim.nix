inputs:
final: prev: {
  nixvim = inputs.nixvim-conf.packages.${prev.system}.default;
}
