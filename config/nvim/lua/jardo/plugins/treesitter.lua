require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'c', 'html', 'javascript', 'python', 'ruby', 'rust', 'typescript'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = true,
  }
}
