vim.g.mapleader = " "

vim.api.nvim_set_option("clipboard", "unnamed")

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
vim.keymap.set('n', '<C-s>', ':w', {})
vim.keymap.set('n', '<C-q>', ':q', {})

vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
