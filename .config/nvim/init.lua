require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

vim.cmd [[ set number ]]
vim.cmd [[ set nowrap ]]
vim.cmd [[ set signcolumn=yes:2 ]]

vim.api.nvim_create_autocmd({"TermOpen"}, {
							pattern = {"*"}, command=":setlocal nonumber norelativenumber"})
vim.diagnostic.config({
	update_in_insert = true
})
