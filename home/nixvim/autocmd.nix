{
  programs.nixvim.autoCmd = [
    {
      command = "set nofoldenable";
      desc = "Disable folding entering the buffer";
      once = true;
      event = [
        "BufEnter"
        "BufWinEnter"
      ];
    }
  ];
}
