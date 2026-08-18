return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_enable_italic = 0
            vim.g.gruvbox_material_disable_italic_comment = 1
        end,
        config = function()
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "gruvbox-material",
                group = vim.api.nvim_create_augroup("GruvboxMaterialOverrides", { clear = true }),
                callback = function()
                    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#d5c4a1", bg = "#f2e5bc" })
                    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#ebdbb2", fg = "#7c6f64" })
                    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#ebdbb2", fg = "#928374" })
                    vim.api.nvim_set_hl(0, "NonText", { fg = "#a89984" })
                end,
            })
            vim.o.background = "light"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    }
}
