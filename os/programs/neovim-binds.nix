{
  programs.nvf.settings.vim.keymaps = [
    # # # - - - Window Navigation - - - # # #
    {
      key = "<C-h>";
      mode = "n";
      action = "<C-w>h";
    }
    {
      key = "<C-l>";
      mode = "n";
      action = "<C-w>l";
    }
    {
      key = "<C-k>";
      mode = "n";
      action = "<C-w>k";
    }
    {
      key = "<C-j>";
      mode = "n";
      action = "<C-w>j";
    }

    # # # - - - Window resizing - - - # # #
    {
      key = "<C-S-h>";
      mode = "n";
      silent = true;
      action = "<C-w><";
    }
    {
      key = "<C-S-l>";
      mode = "n";
      silent = true;
      action = "<C-w>>";
    }
    {
      key = "<C-S-j>";
      mode = "n";
      silent = true;
      action = "<C-w>-";
    }
    {
      key = "<C-S-k>";
      mode = "n";
      silent = true;
      action = "<C-w>+";
    }

    # # # - - - File Explorer - - - # # #
    {
      key = "<leader>e";
      action = "<CMD> lua require('snacks').explorer() <CR>";
      desc = "File Explorer";
      mode = "n";
    }
    {
      key = "<leader>E";
      action = "<CMD> lua require('snacks').explorer({cwd = vim.loop.cwd() }) <CR>";
      desc = "File Explorer (cwd)";
      mode = "n";
    }

    # # # - - - Terminal - - - # # #
    {
      action = "<CMD> lua require('snacks').terminal() <CR>";
      desc = "Terminal";
      key = "<leader><CR>";
      mode = "n";
    }
  ];
}
