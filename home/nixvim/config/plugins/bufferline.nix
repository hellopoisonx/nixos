{
  programs.nixvim.plugins.bufferline = {
    enable = true;
  };
  programs.nixvim.keymaps = [
    {
      action = "<cmd>BufferLineCycleNext<cr>";
      mode = "n";
      key = "<S-l>";
    }
    {
      action = "<cmd>BufferLineCyclePrev<cr>";
      mode = "n";
      key = "<S-h>";
    }
    {
      action = "<cmd>BufferLinePickClose<cr>";
      mode = "n";
      key = "pc";
    }
  ];
}
