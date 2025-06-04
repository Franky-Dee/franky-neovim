return {
    {
        -- Mason: Installs LSP servers
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        -- Bridge between mason and lspconfig
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pylsp" } -- Add other LSP servers as needed
            })
        end
    },
    {
        -- LSP config
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- Set up lua language server
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enabled = true,
                                ignore = { "E501" }, -- E501 = line too long
                                maxLineLength = 120, -- optional: increase line limit if you still want long lines allowed
                            },
                        },
                    },
                },
            })

            -- LSP key mappings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

            -- Configure diagnostics display
            vim.diagnostic.config({
                virtual_text = true,      -- Inline text (e.g. "undefined variable")
                signs = true,             -- Show signs in the gutter
                underline = true,         -- Underline the problem text
                update_in_insert = false, -- Don't update diagnostics in insert mode
                severity_sort = true,     -- Sort by severity
            })
        end
    }
}
