vim.g.mapleader      = ' '

vim.opt.showcmd      = true
vim.opt.laststatus   = 2
vim.opt.autowrite    = true
vim.opt.cursorline   = false
vim.opt.autoread     = true

-- Tab Settings
vim.opt.tabstop      = 4
vim.opt.shiftwidth   = 4
vim.opt.shiftround   = true
vim.opt.expandtab    = false
vim.opt.autoindent   = true

-- General Usage
vim.keymap.set('n', '<leader>ch', ':nohlsearch<CR>')

-- Copy to clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('v', '<leader>y', '"+y')

-- Paste from clipboard
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>P', '"+P')

-- Buffer Manipulation
vim.keymap.set('n', '<tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-tab>', ':bprevious<CR>')
vim.keymap.set('n', '<leader>q', ':bprevious | bd # ! <CR>')

-- Window Manipulation

-- resizing splits
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><S-h>', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><S-j>', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><S-k>', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><S-l>', require('smart-splits').swap_buf_right)
