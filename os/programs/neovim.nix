{
  programs.nvf.settings.vim = {
    vimAlias = true;
    git.gitsigns.enable = true;
    dashboard.alpha.enable = true;
    presence.neocord.enable = true;
    binds.whichKey.enable = true;
    binds.whichKey.setupOpts.preset = "helix";
    clipboard.providers.wl-copy.enable = true;
    filetree.neo-tree = {
      enable = true;
    };
    notes.todo-comments.enable = true;

    #utility.leetcode-nvim.enable = true;
    utility = {
      snacks-nvim.enable = true;
      snacks-nvim.setupOpts = {
        indent = {enabled = true;};
        gh = {enabled = true;};
        scope = {enabled = true;};
        scroll = {enabled = true;};
        statuscolumn = {enabled = true;};
        terminal = {enabled = true;};
        words = {enabled = true;};
      };

      preview.markdownPreview.enable = true;
      multicursors.enable = true;
    };
    tabline.nvimBufferline.enable = true;
    tabline.nvimBufferline.setupOpts.options.always_show_bufferline = false;

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      otter-nvim.enable = true;
    };

    statusline.lualine.enable = true;
    treesitter.enable = true;
    treesitter.autotagHtml = true;

    telescope.enable = true;
    autocomplete.blink-cmp.enable = true;

    ui.noice.enable = true;

    languages = {
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      enableFormat = true;

      bash.enable = true;
      nix.enable = true;
      python.enable = true;
      markdown.enable = true;
      markdown.extensions.markview-nvim.enable = true;
    };

    mini = {
      ai.enable = true;
      icons.enable = true;
      pairs.enable = true;
    };

    options = {
      scrolloff = 5;
      autoindent = true;
      tabstop = 2;
      ignorecase = true;
      smartcase = true;
      expandtab = true;
      softtabstop = 2;
      shiftwidth = 2;
    };

    diagnostics = {
      enable = true;

      config = {
        update_in_insert = false;
        virtual_text = true;
      };
    };
    theme = {
      enable = true;
      transparent = true;
      name = "catppuccin";
      style = "macchiato";
    };
  };
  programs.nvf.enable = true;
}
