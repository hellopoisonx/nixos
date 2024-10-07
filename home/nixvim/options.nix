{
  programs.nixvim = {
    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;
    viAlias = true;
    clipboard = {
      register = "unnamedplus";   
      providers.xclip.enable = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      ignorecase = true;
      smartcase = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smarttab = true;
      cursorline = true;
      ruler = true;
    };
    globals.mapleader = " ";
  };
}
