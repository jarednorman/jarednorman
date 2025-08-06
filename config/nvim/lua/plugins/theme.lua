return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                styles = {
                    comments = {},
                    conditionals = {},
                },
                custom_highlights = function(colors)
                    return {
                        WinSeparator = { fg = colors.surface1, bg = colors.base },
                        StatusLine = { bg = colors.surface0, fg = colors.subtext0 },
                        StatusLineNC = { bg = colors.surface0, fg = colors.overlay0 },
                        NonText = { fg = colors.overlay0 },
                    }
                end,
            })
            vim.o.background = "dark"
            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
