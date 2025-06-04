return {
    {
        -- Mason: Installs LSP servers
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
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

            lspconfig.pylsp.setup {
                settings = {
                    pylsp = {
                        configurationSources = { 'flake8' },
                        plugins = {
                            flake8 = {
                                enabled = false,
                                ignore = { 'E501', 'E231' },
                                maxLineLength = 88,
                            },
                            black = {enabled = true},
                            autopep8 = { enabled = false },
                            mccabe = {enabled = true},
                            pycodestyle = {
                                enabled = true,
                                ignore = { 'E501', 'E231' },
                                maxLineLength = 88,
                            },
                            pyflakes = {enabled = true},
                            jedi_completion = {
                                include_params = true,
                            },
                            jedi_signature_help = {enabled = true},
                            jedi = {
                                extra_paths = {
                                    '/home/franky/Desktop/Workspaces/12.0/odoo/',
                                    '/home/franky/Desktop/Workspaces/12.0/taskflow/',
                                    '/home/franky/Desktop/Workspaces/12.0/taskflow-config/'
                                },
                            },
                        },
                    },
                },
                root_dir = "/home/franky/Desktop/Workspaces/",
            }

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
