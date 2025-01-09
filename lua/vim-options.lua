vim.g.mapleader = " "

vim.api.nvim_set_option("clipboard", "unnamed")

-- Line Numbers --
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabbing --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Window Management
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>', {})
vim.keymap.set('n', '<Leader>sx', ':close<CR>', {})

vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
