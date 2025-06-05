return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "work",
                path = "/home/franky/Documents/Obsidian Vault",
            },
        },
        ui = {
            enable = true,
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
    },
}
