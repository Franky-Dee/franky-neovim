vim.g.mapleader = " "

-- Clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Line Numbers --
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#00FF00", bold = true })

-- Tabbing --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Scroll Offset
vim.opt.scrolloff = 8

-- Window Management
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>', {})
vim.keymap.set('n', '<Leader>sx', ':close<CR>', {})

-- Save and Quit
vim.keymap.set('n', '<C-s>', ':wa<CR>', {})
vim.keymap.set('n', '<C-q>', ':q<CR>', {})

-- Center vertical navigation
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})

vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})

-- Movement Across buffers
vim.keymap.set('n', '<A-h>', '<C-w>h', {})
vim.keymap.set('n', '<A-j>', '<C-w>j', {})
vim.keymap.set('n', '<A-k>', '<C-w>k', {})
vim.keymap.set('n', '<A-l>', '<C-w>l', {})

-- Remove Search
vim.keymap.set('n', '<Leader>n', ':noh<CR>', {})
