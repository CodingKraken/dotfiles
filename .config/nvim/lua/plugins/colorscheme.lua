return {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000, -- load before other packages 
    config = function()
        vim.cmd([[colorscheme nordic]])
    end
}
