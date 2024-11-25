-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Tabs and indentation
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

-- Disable Swap and Shada
vim.opt.swapfile = false
-- Theme
vim.cmd.colorscheme("catppuccin-macchiato")

-- Set the mapleader to space
vim.g.mapleader = " "
