return {
    'stevearc/aerial.nvim',
    opts = {
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        {
            'nvim-telescope/telescope.nvim',
            opts = function(_, opts)
                require('telescope').setup {
                    extensions = {
                        aerial = {
                            show_nesting = {
                                ['_'] = false,
                                json = true,
                                yaml = true,
                            },
                        }
                    }
                }
                require('telescope').load_extension('aerial')
            end,
        }
    },
}
