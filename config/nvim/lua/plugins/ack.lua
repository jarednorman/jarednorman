return {
  "mileszs/ack.vim",
  init = function()
    vim.cmd("let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'")
  end
}
