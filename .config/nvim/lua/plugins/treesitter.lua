return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "bash", "c", "lua", "latex", "python",
                                 "query", "vim", "vimdoc" },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
