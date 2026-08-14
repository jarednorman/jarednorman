return {
    {
        "sainnhe/edge",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.edge_style = "default"
            vim.g.edge_enable_italic = 0
            vim.g.edge_disable_italic_comment = 1
            vim.g.edge_better_performance = 1
        end,
        config = function()
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "edge",
                group = vim.api.nvim_create_augroup("EdgeOverrides", { clear = true }),
                callback = function()
                    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#dde2e7", bg = "#fafafa" })
                    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#e8ebf0", fg = "#8790a0" })
                    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#e8ebf0", fg = "#bac3cb" })
                    vim.api.nvim_set_hl(0, "NonText", { fg = "#bac3cb" })
                end,
            })
            vim.o.background = "light"
            vim.cmd.colorscheme("edge")
        end,
    }
}
