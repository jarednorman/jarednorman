Mapper = require("nvim-mapper")

-- Disable annoying things:
vim.cmd 'nnoremap K \\<noop>'
vim.cmd 'vnoremap K \\<noop>'
vim.cmd 'nnoremap <c-w>o \\<noop>'
vim.cmd 'vnoremap <c-w>o \\<noop>'

-- Telescope Stuff
Mapper.map(
  'n',
  '<leader><leader>',
  "<cmd>lua require('telescope.builtin').find_files()<cr>",
  {
    silent = true,
    noremap = true
  },
  "Telescope",
  "find_files",
  "Search for files"
)
Mapper.map(
  'n',
  '<leader>g',
  "<cmd>lua require('telescope.builtin').live_grep()<cr>",
  {
    silent = true,
    noremap = true
  },
  "Telescope",
  "live_grep",
  "Grep codebase"
)
Mapper.map('n',
  '<leader>b',
  "<cmd>lua require('telescope.builtin').buffers()<cr>",
  {
    silent = true,
    noremap = true
  },
  "Telescope",
  "find_buffers",
  "Search for buffers"
)

-- Clear search.
Mapper.map('n',
  '<leader>/',
  '<cmd>let @/=""<cr>',
  {
    silent = true,
    noremap = true
  },
  "Misc",
  "clear_search",
  "Clear search"
)

-- Run tests.
Mapper.map('n',
  '<leader>r',
  '<cmd>:!bundle exec rspec %<cr>',
  {
    silent = true,
    noremap = true
  },
  "External commands",
  "rspec",
  "Run RSpec on current file"
)

Mapper.map(
  'n',
  '<leader>n',
  "<cmd>tabd windo set invnumber<cr>",
  {
    silent = true,
    noremap = true
  },
  "Misc",
  "toggle_numbers",
  "Toggle line numbers"
)
