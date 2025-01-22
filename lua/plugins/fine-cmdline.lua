return {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    lazy = false,
    config = function()
        require("fine-cmdline").setup({
            cmdline = {
                enable_keymaps = true,
                smart_history = true,
                prompt = ":",
            },
            popup = {
                position = {
                    row = "50%",
                    col = "50%",
                },
                size = {
                    width = "50%",
                    height = "auto",
                },
                border = {
                    style = "rounded",
                    text = {
                        top = " Command ",
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                },
            },
            hooks = {
                before_execute = function(cmdline)
                    print("Executing command:", cmdline)
                end,
            },
        })

        vim.keymap.set("n", ":", ":FineCmdline<CR>", { noremap = true, silent = true })
    end,
}


