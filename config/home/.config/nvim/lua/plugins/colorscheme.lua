return {
  -- add catppuccin
  { "catppuccin/nvim" },

  -- Configure LazyVim to load catppuccin-macchiato
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
