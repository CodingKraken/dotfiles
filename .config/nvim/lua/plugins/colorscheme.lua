return {
    "WTFox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("jellybeans").setup({
            italics = false
        })
        vim.cmd([[colorscheme jellybeans]])
    end
}
