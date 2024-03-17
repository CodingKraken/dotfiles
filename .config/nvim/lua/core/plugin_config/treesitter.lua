require('nvim-treesitter.parsers').get_parser_configs().asm = {
    install_info = {
        url = 'https://github.com/rush-rs/tree-sitter-asm.git',
        files = { 'src/parser.c' },
        branch = 'main',
    },
}

require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "asm", "c", "cpp", "lua", "rust", "python", "vim", "javascript", "latex", "make" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {"Python"},
	}
}
