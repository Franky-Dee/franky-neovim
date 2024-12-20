return {
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            preset = "slanted",
            align = "right",
            animation = true,
            clickable = true,
            gitsigns = {
                added = { enabled = true, icon = '+' },
                changed = { enabled = true, icon = '~' },
                deleted = { enabled = true, icon = '-' },
            },
            insert_at_end = true,
        },
        version = '^1.0.0',

        vim.keymap.set('n', '<A-Tab>', '<Cmd>BufferPrevious<CR>', {}),
        vim.keymap.set('n', '<A-Shift-Tab>', '<Cmd>BufferNext<CR>', {}),
        vim.keymap.set('n', '<A-w>', '<Cmd>BufferClose<CR>', {}),
    },
}

