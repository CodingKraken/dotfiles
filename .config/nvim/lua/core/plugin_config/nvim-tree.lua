vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	prefer_startup_root = false,
	update_focused_file = {
		enable = true,
		update_root = true
	},
})

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle!<CR>')
