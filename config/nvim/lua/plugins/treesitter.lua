return {{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "html",
        "javascript",
        "python",
        "rust",
        "typescript",
        "ruby",
        "tsx",
        "markdown",
        "lua",
        "vim",
        "vimdoc"
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
      -- indent = { enable = true },
    })
  end
}}
