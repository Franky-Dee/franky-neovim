return {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    priority = 1001,
    config = function()
        vim.cmd.colorscheme "oxocarbon"
        vim.opt.background = "dark"
    end
}
