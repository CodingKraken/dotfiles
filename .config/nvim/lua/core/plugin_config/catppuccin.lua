vim.o.termguicolors = true

require("catppuccin").setup({
    integrations = {
        neotree = true,
        treesitter = true,
    }
})

vim.cmd [[ colorscheme catppuccin-mocha ]]
