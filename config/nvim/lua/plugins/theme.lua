-- Test
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function()
      vim.cmd [[set background=dark]]
      vim.cmd [[colorscheme catppuccin-mocha]]
    end,
  }
}
