{
  programs.nvf.settings.vim = {
    vimAlias = true;
    git.gitsigns.enable = true;
    presence.neocord.enable = true;
    clipboard.providers.wl-copy.enable = true;
    filetree.neo-tree.enable = true;
    notes.todo-comments.enable = true;

    utility = {
      snacks-nvim = {
        enable = true;
        setupOpts = {
          indent = {enabled = true;};
          scroll = {enabled = true;};
          terminal = {enabled = true;};
        };
      };
      preview.markdownPreview.enable = true;
      images.img-clip.enable = true;
      multicursors.enable = true;
    };
    tabline.nvimBufferline.enable = true;
    tabline.nvimBufferline.setupOpts.options.always_show_bufferline = false;

    lsp = {
      enable = true;
      formatOnSave = true;
    };

    statusline.lualine.enable = true;
    treesitter.enable = true;
    treesitter.autotagHtml = true;

    telescope.enable = true;
    autocomplete.blink-cmp.enable = true;
    autocomplete.blink-cmp.friendly-snippets.enable = true;

    ui.noice.enable = true;

    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      bash.enable = true;
      nix.enable = true;
      python.enable = true;
      markdown.enable = true;
      markdown.extensions.markview-nvim.enable = true;
    };

    mini = {
      icons.enable = true;
      pairs.enable = true;
    };

    options = {
      scrolloff = 10;
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
        update_in_insert = true;
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
