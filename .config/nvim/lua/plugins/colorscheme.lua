return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000, -- load before other packages 
    config = function()
        vim.cmd([[colorscheme nightfox]])
    end
}
