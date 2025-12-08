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
                ensure_installed = { "bashls", "clangd", "lua_ls", "pylsp",
                                     "texlab", "zls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local on_attach = function(client, bufnr)
                vim.lsp.completion.enable(true, client.id, bufnr, {
                    autotrigger = true,
                    convert = function(item)
                        return { abbr = item.label:gsub("%b()", "") }
                    end,
                })
                vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, {})
            end

            vim.lsp.config("*", {on_attach = on_attach})

            vim.lsp.enable {
                "bashls", "clangd", "lua_ls", "pylsp", "texlab", "zls",
            }

            -- setup autocomplete
            vim.opt.completeopt = { "menuone", "noselect", "popup" }

            --lspconfig.bashls.setup({on_attach = on_attach})
            --lspconfig.clangd.setup({on_attach = on_attach})
            --lspconfig.lua_ls.setup({on_attach = on_attach})
            --lspconfig.pylsp.setup({
            --    on_attach=on_attach,
            --})
            --lspconfig.texlab.setup({on_attach = on_attach})
            --lspconfig.zls.setup({on_attach = on_attach})

            local border_style = "rounded"
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover { border=border_style } end, {})
            vim.keymap.set("n", "<leader>d", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gK", function()
            vim.diagnostic.open_float { border=border_style } end, {})
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
        end
    }
}
