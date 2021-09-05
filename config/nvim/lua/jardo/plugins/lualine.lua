require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'onelight',
    component_separators = {'│', '│'},
    section_separators = {'', ''},
  },
  extensions = {'fugitive'}
}
