{
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    git.gitsigns.enable = true;
    presence.neocord.enable = true;
    binds.whichKey.enable = true;
    clipboard.providers.wl-copy.enable = true;
    filetree.neo-tree.enable = true;
    lsp.trouble.enable = true;
    tabline.nvimBufferline.enable = true;
    tabline.nvimBufferline.setupOpts.options.always_show_bufferline = false;
    utility.snacks-nvim.enable = true;
    lsp.enable = true;
    statusline.lualine.enable = true;
    treesitter.enable = true;
    telescope.enable = true;
    ui.noice.enable = true;
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
      enable = true;
      style = "macchiato";
      transparent = true;
      name = "catppuccin";
    };
  };
}
