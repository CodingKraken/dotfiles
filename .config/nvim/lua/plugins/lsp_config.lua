return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
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

            vim.lsp.enable({
                "bashls", "clangd", "lua_ls", "pylsp", "texlab", "zls",
            })

            -- setup autocomplete
            vim.opt.completeopt = { "menuone", "noselect", "popup" }

            vim.lsp.config("bashls", { on_attach = on_attach })
            vim.lsp.config("clangd", { on_attach = on_attach })
            vim.lsp.config("lua_ls", { on_attach = on_attach })
            vim.lsp.config("pylsp",  { on_attach = on_attach })
            vim.lsp.config("texlab", { on_attach = on_attach })
            vim.lsp.config("zls", { on_attach = on_attach })

            local border_style = "rounded"
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover({ border=border_style }) end, {})
            vim.keymap.set("n", "<leader>d", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gK", function()
                vim.diagnostic.open_float({ border=border_style }) end, {})
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
        end
    }
}
