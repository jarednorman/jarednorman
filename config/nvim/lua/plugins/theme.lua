return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    init = function()
      vim.o.background = dark
      vim.cmd [[colorscheme rose-pine]]
    end
  }
}
