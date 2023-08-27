require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"asm_lsp",			-- x86 assembly language server
		"clangd",			-- C/C++ language server
		"lua_ls",			-- lua language server
		"pyright",			-- Python language server
		"rust_analyzer",	-- Rust language server
		"tsserver",			-- JavaScript/TypeScript language server
	}
})

local on_attach = function(_ , _)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").asm_lsp.setup {
	on_attach = on_attach
}

require("lspconfig").clangd.setup {
	on_attach = on_attach
}

require("lspconfig").lua_ls.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
}

require("lspconfig").pyright.setup {
	on_attach = on_attach
}

require("lspconfig").rust_analyzer.setup {
	on_attach = on_attach
}

require("lspconfig").tsserver.setup {
	on_attach = on_attach
}
