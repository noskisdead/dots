{
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    git.gitsigns.enable = true;
    presence.neocord.enable = true;
    binds.whichKey.enable = true;
    clipboard.providers.wl-copy.enable = true;
    filetree.neo-tree.enable = true;
    notes.todo-comments.enable = true;
    lsp.trouble.enable = true;
    utility.snacks-nvim.enable = true;
    utility.snacks-nvim.setupOpts = {
      opts = {
        indent = { enabled = true; };
        scope = { enabled = true; };
        scroll = { enabled = true; };
        statuscolumn = { enabled = true; };
        words = { enabled = true; };
      };
    };
    tabline.nvimBufferline.enable = true;
    tabline.nvimBufferline.setupOpts.options.always_show_bufferline = false;
    lsp.enable = true;
    statusline.lualine.enable = true;
    treesitter.enable = true;
    treesitter.autotagHtml = true;
    treesitter.indent.enable=true;
    telescope.enable = true;
    autocomplete.blink-cmp.enable = true;
    ui.noice.enable = true;
    vimAlias = true;
    languages = {
      bash.enable = true;
      nix.enable = true;
      nix.extraDiagnostics.enable = true;
      python.enable = true;
    };
    mini = {
      ai.enable = true;
      icons.enable = true;
      pairs.enable = true;
    };
    options = {
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
    };
    theme = {
      enable = true;
      style = "macchiato";
      transparent = true;
      name = "catppuccin";
    };
  };
}
