-- Test
return {
  {
    "dracula/vim",
    name = "dracula",
    init = function()
      vim.cmd [[set background=dark]]
      vim.cmd [[colorscheme dracula]]
    end,
  }
}
