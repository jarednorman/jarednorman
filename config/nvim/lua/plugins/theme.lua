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
        WinSeparator = { fg = "surface", bg = "base" },
      },
    },
    init = function()
      vim.o.background = dark
      vim.cmd [[colorscheme rose-pine]]
    end,
  }
}
