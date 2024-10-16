{ config, ... }:
let
  nmap =
    action:
    (key: {
      inherit action;
      inherit key;
      mode = "n";
    });
  imap =
    action:
    (key: {
      inherit action;
      inherit key;
      mode = "i";
    });
in
{
  programs.nixvim.keymaps = config.lib.nixvim.keymaps.mkKeymaps { options.silent = true; } [
    (imap "<Esc>" "jj")
    (nmap "<C-w>h" "<C-h>")
    (nmap "<C-w>j" "<C-j>")
    (nmap "<C-w>k" "<C-k>")
    (nmap "<C-w>l" "<C-l>")
    (nmap "<cmd>vertical resize -2<cr>" "<C-left>")
    (nmap "<cmd>vertical resize +2<cr>" "<C-right>")
    (nmap "<cmd>vsplit<cr>" "sv")
    (nmap "<cmd>split<cr>" "sh")
    (nmap "<cmd>close<cr>" "sc")
    (nmap "<cmd>bd<cr>" "bd")
    (nmap "$" "T")
    (nmap "^" "A")
    (nmap { __raw = "require('conform').format"; } "<leader>cf")
    (nmap {__raw = "require('flash').jump";} "F")
  ];
}
