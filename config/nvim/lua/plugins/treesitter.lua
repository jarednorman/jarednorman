local languages = {
    "c",
    "html",
    "javascript",
    "python",
    "rust",
    "typescript",
    "rescript",
    "ruby",
    "tsx",
    "markdown",
    "markdown_inline",
    "lua",
    "vim",
    "vimdoc",
}

return { {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(languages)

        -- The `main` branch no longer enables highlighting itself; start it
        -- per-buffer whenever a parser is available for the filetype.
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang and vim.treesitter.language.add(lang) then
                    vim.treesitter.start(args.buf, lang)
                    -- Keep vim regex highlighting on top (was
                    -- additional_vim_regex_highlighting = true).
                    vim.bo[args.buf].syntax = "on"
                end
            end,
        })
    end,
} }
