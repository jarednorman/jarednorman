-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Do not use mouse support.
vim.o.mouse = ''

-- I like pretty things.
vim.o.termguicolors = true

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

-- Disable annoying things:
vim.cmd 'nnoremap K \\<noop>'
vim.cmd 'vnoremap K \\<noop>'
vim.cmd 'nnoremap <c-w>o \\<noop>'
vim.cmd 'vnoremap <c-w>o \\<noop>'

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },

  -- automatically check for plugin updates
  -- but don't tell me about them
  checker = { enabled = true, notify = false }
})
