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
  use 'tpope/vim-dispatch'
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
        options = { section_separators = '', component_separators = '' },
        tabline = {
          lualine_a = {},
          lualine_c = {
            {
              'tabs',
               max_length = vim.o.columns,
               mode = 1,
               -- tabs_color = {
               --   active = { fg = '#d5c4a1', bg = '#1d2021' },
               --   inactive = { fg = '665c54', bg = '#3c3836' },
               -- },
               fmt = function(name, context)
                 -- Show + if buffer is modified in tab
                 local buflist = vim.fn.tabpagebuflist(context.tabnr)
                 local winnr = vim.fn.tabpagewinnr(context.tabnr)
                 local bufnr = buflist[winnr]
                 local mod = vim.fn.getbufvar(bufnr, '&mod')

                 return name .. (mod == 1 and '+' or '')
               end
            }
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        }
      }
    end
  }

  use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim",
    config = function()
      vim.cmd([[set background=light]])
      vim.cmd([[colo zenbones]])
    end
  }
end)
