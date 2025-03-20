return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "bashls", "clangd", "lua_ls", "pylsp", "texlab" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.bashls.setup({})
            lspconfig.clangd.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enabled = false
                            }
                        }
                    }
                }
            })
            lspconfig.texlab.setup({})
            vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
        end
    }
}
