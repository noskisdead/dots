{
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    clipboard.providers.wl-copy.enable = true;
    filetree.neo-tree.enable = true;
    tabline.nvimBufferline.enable = true;
    tabline.nvimBufferline.setupOpts.options.always_show_bufferline = false;
    lsp.enable = true;
    statusline.lualine.enable = true;
    treesitter.enable = true;
    telescope.enable = true;
    vimAlias = true;
    languages = {
      bash.enable = true;
      nix.enable = true;
      nix.extraDiagnostics.enable = true;
      python.enable = true;
    };
    mini = {
      icons.enable = true;
      pairs.enable = true;
    };
    options = {
      softtabstop = 2;
      tabstop = 2;
      shiftwidth = 2;
    };
    theme = {
      name = "catppuccin";
    };
  };
}
