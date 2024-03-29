-- The final frontier.
vim.g.mapleader = ' '

-- Do not use mouse support.
vim.o.mouse = ''

-- I like pretty things.
vim.o.termguicolors = true
vim.o.background = 'light'

-- Use two spaces for indentation.
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true

vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true

vim.o.autoread = true

vim.o.number = false

-- Focus the "new" split.
vim.o.splitbelow = true
vim.o.splitright = true

-- Ignore case in search unless the search contains capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Probably make terminal stuff faster. Entirely stolen from people smarter
-- than me.
vim.o.lazyredraw = true
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 0
vim.o.updatetime = 50

vim.o.list = true
vim.o.listchars = "trail:␣"
