return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
    config = function()
        require("nvim-treesitter").install({
            "bash", "c", "lua", "latex", "python", "query", "vim", "vimdoc", "zig",
        })
    end
}
