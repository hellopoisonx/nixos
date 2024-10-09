{ config, ... }:
let 
  nmap = action: (key: {inherit action; inherit key; mode = "n";});
  imap = action: (key: {inherit action; inherit key; mode = "i";});
in 
{
  programs.nixvim.keymaps =
    config.lib.nixvim.keymaps.mkKeymaps
    {options.silent = true;}
    [
      (imap  "<Esc>" "jj")
      (nmap "<C-w>h" "<C-h>")
      (nmap "<C-w>j" "<C-j>")
      (nmap "<C-w>k" "<C-k>")
      (nmap "<C-w>l" "<C-l>")
      (nmap "<C-left>" "<cmd>vertical resize -2<cr>")
      (nmap "<C-right>" "<cmd>vertical resize +2<cr>")
      (nmap "<cmd>vsplit<cr>" "sv")
      (nmap "<cmd>split<cr>" "sh")
      (nmap "<cmd>bw<cr>" "sc")
      (nmap "$" "T")
      (nmap "^" "A")
    ];
}
