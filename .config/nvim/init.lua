require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

vim.cmd [[ set number relativenumber ]]
vim.cmd [[ set nu rnu ]]
vim.cmd [[ set cursorline ]]
vim.cmd [[ set signcolumn=yes:1 ]]

vim.api.nvim_create_autocmd({"TermOpen"}, {
							pattern = {"*"}, command=":setlocal nonumber norelativenumber"})
vim.diagnostic.config({
	update_in_insert = true
})

vim.cmd [[ sign define DiagnosticSignError text=E texthl=DiagnosticSignError linehl= numhl=DiagnosticSignError ]]
vim.cmd [[ sign define DiagnosticSignWarn text=W texthl=DiagnosticSignWarn linehl= numhl=DiagnosticSignWarn ]]
vim.cmd [[ sign define DiagnosticSignInfo text=I texthl=DiagnosticSignInfo linehl= numhl=DiagnosticSignInfo ]]
vim.cmd [[ sign define DiagnosticSignHint text=H texthl=DiagnosticSignHint linehl= numhl=DiagnosticSignHint ]]
