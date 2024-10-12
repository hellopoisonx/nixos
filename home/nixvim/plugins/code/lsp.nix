{ ... }:
{
  programs.nixvim.plugins.lsp-format = {
    enable = false; # use conform instead
    lspServersToEnable = "all";
  };
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    keymaps = {
      diagnostic = {
        "]g" = "goto_next";
        "[g" = "goto_prev";
      };
      lspBuf = {
        K = "hover";
        gr = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
    };
    servers = {
      nixd.enable = true;
      clangd.enable = true;
      lua_ls.enable = true;
      bashls.enable = true;
    };
  };
}
