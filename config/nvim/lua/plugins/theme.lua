return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.gruvbox_material_background = "hard"
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
                    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3c3836", bg = "#1d2021" })
                    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#282828", fg = "#a89984" })
                    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#282828", fg = "#928374" })
                    vim.api.nvim_set_hl(0, "NonText", { fg = "#928374" })
                end,
            })
            vim.o.background = "dark"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    }
}
