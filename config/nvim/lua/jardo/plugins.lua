-- This snippet installs packer if it's not present:
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Just tpope things.
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  use 'christoomey/vim-tmux-navigator'

  use 'rescript-lang/vim-rescript'

  use {
    "mileszs/ack.vim",
    config = function()
      vim.cmd "set grepprg=rg\\ --vimgrep\\ --no-heading"
      vim.cmd "set grepformat=%f:%l:%c:%m,%f:%l:%m"
      vim.cmd "let g:ackprg='rg --vimgrep --no-heading'"
    end
  }

  use {
    "lazytanuki/nvim-mapper",
    config = function()
      require("nvim-mapper").setup{}
      require("jardo.plugins.nvim-mapper")
    end,
    before = "telescope.nvim"
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {fuzzy = false}
        }
      }
      require("telescope").load_extension("mapper")
      require("telescope").load_extension("fzf")
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('jardo.plugins.treesitter')
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { section_separators = '', component_separators = '' }
      }
    end
  }

  use {
    'RRethy/nvim-base16',
    config = function()
      vim.cmd([[colo base16-gruvbox-light-soft]])

      local colour0  = '#f2e5bc'
      local colour7  = '#504945'
      local colour8  = '#bdae93'
      local colour9  = '#af3a03'
      local colour10 = '#ebdbb2'
      local colour13 = '#3c3836'

      -- Base16 Gruvbox Light Soft Background
      local popUpBackground = colour10

      -- Set status lines to be prettier
      vim.cmd(string.format([[highlight StatusLine guibg=%s guifg=%s]], colour10, colour13))
      vim.cmd(string.format([[highlight StatusLineNC guibg=%s guifg=%s]], colour10, colour8))

      -- Set visual highlights to be prettier.
      vim.cmd(string.format([[highlight Visual guibg=%s guifg=%s]], colour13, colour8))

      -- Set vertical dividers to be prettier.
      vim.cmd(string.format([[highlight VertSplit guibg=none guifg=%s]], colour10))

      -- Set line numbers to colour8
      vim.cmd(string.format([[highlight LineNr guibg=none guifg=%s]], colour10))

      -- Style search stuff consistently.
      vim.cmd(string.format([[highlight IncSearch guibg=%s guifg=%s]], colour9, colour0))
      vim.cmd(string.format([[highlight Search guibg=NONE guifg=%s gui=underline]], colour9))

      -- Fix Telescope colours
      vim.cmd(string.format([[highlight TelescopeBorder guibg=%s guifg=%s]], popUpBackground, popUpBackground))
      vim.cmd(string.format([[highlight TelescopePromptBorder guibg=%s guifg=%s]], popUpBackground, popUpBackground))
      vim.cmd(string.format([[highlight TelescopeNormal guibg=%s guifg=%s]], popUpBackground, colour7))
      vim.cmd(string.format([[highlight TelescopePromptNormal guibg=%s guifg=%s]], popUpBackground, colour7))
      vim.cmd(string.format([[highlight TelescopeResultsTitle guibg=%s guifg=%s]], colour8, colour7))
      vim.cmd(string.format([[highlight TelescopePromptTitle guibg=%s guifg=%s]], colour8, colour7))
      vim.cmd(string.format([[highlight TelescopePreviewTitle guibg=%s guifg=%s]], colour8, colour7))
      vim.cmd(string.format([[highlight TelescopeSelection guibg=%s guifg=%s gui=bold]], colour10, colour7))
      vim.cmd(string.format([[highlight TelescopePromptPrefix guibg=%s guifg=%s gui=bold]], popUpBackground, colour7))
      vim.cmd(string.format([[highlight TelescopeMatching guibg=none guifg=%s gui=bold]], colour9))
    end
  }
end)
