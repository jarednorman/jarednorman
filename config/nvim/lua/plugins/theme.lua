-- Test
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },
            highlight_groups = {
                WinSeparator = { fg = "overlay", bg = "base" },
                StatusLine = { bg = "overlay", fg = "subtle" },
                StatusLineNC = { bg = "overlay", fg = "muted" },
                NonText = { fg = "muted" }
            },
        },
        init = function()
            vim.cmd [[set background=light]]
            vim.cmd [[colorscheme rose-pine]]
        end,
    }
}
