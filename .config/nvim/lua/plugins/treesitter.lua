return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "bash", "c", "lua", "latex", "python" },
            highlight = { enabled = true },
            autotag = { enabled = true },
            indent = { enabled = true },
        })
    end
}
