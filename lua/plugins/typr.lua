return {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },

    vim.keymap.set("n", "<Leader>tt", ":Typr<CR>", { desc = "Start Typr" }),
    vim.keymap.set("n", "<Leader>ts", ":TyprStats<CR>", { desc = "Typr Stats" })
}
