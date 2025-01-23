return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        notify = {
            render = "simple",
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup({
                    stages = "fade",
                })
            end,
        },
    },
}

