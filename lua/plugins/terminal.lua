return {
    'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm').setup {
            direction = 'horizontal',
        }
    end,

    vim.keymap.set('n', '<leader>ot', ':ToggleTerm<CR>', {}),
    vim.keymap.set('t', '<C-c>', '<C-\\><C-n>', {}),
}
