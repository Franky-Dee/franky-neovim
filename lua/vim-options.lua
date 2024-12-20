vim.cmd("set expandtab ")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.wo.relativenumber = true
vim.g.mapleader = " "

-- Window Management
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>', {})
vim.keymap.set('n', '<Leader>sx', ':close<CR>', {})

vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
