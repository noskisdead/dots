{
  programs.nvf.settings.vim = {
    vimAlias = true;
    binds = {
      whichKey.enable = true;
      whichKey.setupOpts.preset = "helix";
    };
    git.gitsigns.enable = true;
    presence.neocord.enable = true;
    undoFile.enable = true;
    clipboard.providers.wl-copy.enable = true;
    notes.todo-comments.enable = true;

    utility = {
      snacks-nvim = {
        enable = true;
        setupOpts = {
          explorer = {enabled = true;};
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
      trouble.enable = true;
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
      clang.enable = true;
      css.enable = true;
      go.enable = true;
      html.enable = true;
      nix.enable = true;
      markdown.enable = true;
      markdown.extensions.markview-nvim.enable = true;
      python.enable = true;
      zig.enable = true;
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
    keymaps = [
      # # # - - - Window Navigation - - - # # #
      {
        key = "<leader><tab><tab>";
        mode = "n";
        action = "<cmd>tabnew<CR>";
        desc = "New tab";
      }
      {
        key = "<leader><tab>d";
        mode = "n";
        action = "<cmd>tabclose<CR>";
        desc = "Close tab";
      }
      {
        key = "<leader><tab>[";
        mode = "n";
        action = "<cmd>BufferLineCyclePrev<CR>";
        desc = "Previous tab";
      }
      {
        key = "<leader><tab>]";
        mode = "n";
        action = "<cmd>BufferLineCycleNext<CR>";
        desc = "Next tab";
      }
      {
        key = "<leader><tab>o";
        mode = "n";
        action = "<cmd>BufferLineCloseOthers<CR>";
        desc = "Close other tabs";
      }
      {
        key = "<leader><tab>f";
        mode = "n";
        action = "<cmd>tabfirst<CR>";
        desc = "First tab";
      }
      {
        key = "<leader><tab>l";
        mode = "n";
        action = "<cmd>tablast<CR>";
        desc = "Last tab";
      }

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

      {
        key = "<C-S-h>";
        mode = "n";
        action = "<C-w><";
      }
      {
        key = "<C-S-l>";
        mode = "n";
        action = "<C-w>>";
      }
      {
        key = "<C-S-j>";
        mode = "n";
        action = "<C-w>-";
      }
      {
        key = "<C-S-k>";
        mode = "n";
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
        key = "<leader>t";
        mode = "n";
      }
    ];
  };
  programs.nvf.enable = true;
}
