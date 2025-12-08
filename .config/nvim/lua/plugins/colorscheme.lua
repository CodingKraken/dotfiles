return {
    -- "sainnhe/sonokai",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --     vim.g.sonokai_disable_italic = 1
    --     vim.g.sonokai_disable_italic_comment = 1
    --     vim.g.sonokai_style = "shusia"
    --     vim.cmd([[colorscheme sonokai]])
    -- end
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false
            },
            contrast = "hard"
        })
        vim.cmd([[colorscheme gruvbox]])
    end
}
