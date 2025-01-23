return {
    'wakatime/vim-wakatime', lazy = false,
    vim.keymap.set('n', '<leader>st', ':WakaTimeToday<CR>', {}),
}
