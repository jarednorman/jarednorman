return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    styles = {
                        comments = "NONE",
                        keywords = "NONE",
                        types = "NONE",
                    },
                },
                groups = {
                    all = {
                        WinSeparator = { fg = "palette.bg3", bg = "palette.bg1" },
                        StatusLine = { bg = "palette.bg2", fg = "palette.fg2" },
                        StatusLineNC = { bg = "palette.bg2", fg = "palette.fg3" },
                        NonText = { fg = "palette.comment" },
                    },
                },
            })
            vim.cmd.colorscheme("nightfox")
        end,
    }
}
