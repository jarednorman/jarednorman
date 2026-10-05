return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "dawn",
                styles = {
                    bold = true,
                    italic = false,
                },
                highlight_groups = {
                    WinSeparator = { fg = "highlight_med", bg = "base" },
                    StatusLine = { bg = "overlay", fg = "subtle" },
                    StatusLineNC = { bg = "overlay", fg = "muted" },
                    NonText = { fg = "muted" },
                },
            })
            vim.o.background = "light"
            vim.cmd.colorscheme("rose-pine")
        end,
    }
}
