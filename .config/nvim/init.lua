-- establish sensible neovim environment defaults

-- a 4 character tabstop is nice
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.tabstop     = 4
vim.opt.smarttab    = true
vim.opt.autoindent  = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- set line numberings
vim.opt.number = true
vim.opt.relativenumber = true

-- Keybinds

-- set the leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent=true, remap=false })

vim.g.mapleader = " "
vim.g.localleader = " "

vim.keymap.set("n", "<Leader>ch", ":nohlsearch<CR>")

require("config.lazy")
