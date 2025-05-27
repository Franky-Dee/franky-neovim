return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "FabianWirth/search.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            local builtin = require('telescope.builtin')

            require("search").setup({
                mappings = {
                    next = "<Tab>",
                    prev = "<S-Tab>",
                },
                tabs = {
                    {
                        name = "Files",
                        tele_func = function(opts)
                            opts = opts or {}
                            if vim.fn.isdirectory(".git") == 1 then
                                builtin.git_files(opts)
                            else
                                builtin.find_files(opts)
                            end
                        end,
                    },
                    {
                        name = "Grep",
                        tele_func = builtin.live_grep,
                    },
                    {
                        name = "Commits",
                        tele_func = builtin.git_commits,
                        available = function()
                            return vim.fn.isdirectory(".git") == 1
                        end,
                    },
                    {
                        name = "Todo",
                        tele_func = function(opts)
                            opts = opts or {}
                            vim.cmd("TodoTelescope")
                        end,
                    },
                    {
                        name = "Aerial",
                        tele_func = function(opts)
                            opts = opts or {}
                            require('telescope').extensions.aerial.aerial(opts)
                        end,
                    },
                },
            })

            vim.keymap.set("n", "<C-p>", function()
                require('search').open({ tab_name = "Files" })
            end, { desc = "Open search.nvim on Files tab" })

            vim.keymap.set("n", "<C-f>", function()
                require('search').open({ tab_name = "Grep" })
            end, { desc = "Open search.nvim on Grep tab" })
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
    },
}
