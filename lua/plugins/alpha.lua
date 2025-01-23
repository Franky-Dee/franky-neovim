return {

    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Define the centered logo/header
        dashboard.section.header.val = {
            [[                                              ]],
            [[                                              ]],
            [[                                              ]],
            [[  .g8"""bgd   .g8""8q. `7MM"""Yb. `7MM"""YMM  ]],
            [[.dP'     `M .dP'    `YM. MM    `Yb. MM    `7  ]],
            [[dM'       ` dM'      `MM MM     `Mb MM   d    ]],
            [[MM          MM        MM MM      MM MMmmMM    ]],
            [[MM.         MM.      ,MP MM     ,MP MM   Y  , ]],
            [[`Mb.     ,' `Mb.    ,dP' MM    ,dP' MM     ,M ]],
            [[  `"bmmmd'    `"bmmd"' .JMMmmmdP' .JMMmmmmMMM ]],
            [[                                              ]],
            [[                                              ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "📂  New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
            dashboard.button("w", "📝  Find Word", ":Telescope live_grep<CR>"),
        }

        dashboard.section.header.opts.hl = "Title" -- Change 'Title' to match your theme's highlight group for header text.
        dashboard.section.buttons.opts.hl = "Function" -- Use a theme-based highlight group for buttons.
        dashboard.section.footer.opts.hl = "Comment" -- Footer matching the theme.

        alpha.setup({
            layout = {
                { type = "padding", val = 8 }, -- Padding to push the logo down
                dashboard.section.header,
                { type = "padding", val = 2 }, -- Space below the logo
                dashboard.section.buttons,
            },
            opts = {},
        })
    end,
}

