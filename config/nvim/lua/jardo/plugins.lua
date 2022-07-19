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

  use 'dag/vim-fish'

  use 'rescript-lang/vim-rescript'

  use {
    "dcampos/nvim-snippy",
    config = function()
      require("snippy").setup({
        mappings = {
          is = {
            ["<Tab>"] = "expand_or_advance",
            ["<S-Tab>"] = "previous",
          },
          nx = {
            ["<leader>x"] = "cut_text",
          },
        },
      })
    end,
  }

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
    'nvim-treesitter/playground',
    requires = {
      {'nvim-treesitter/nvim-treesitter'}
    },
    config = function()
      vim.cmd [[nnoremap <leader>. :TSHighlightCapturesUnderCursor<cr>]]
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() vim.cmd [[TSUpdate]] end,
    config = function() require('jardo.plugins.treesitter') end
  }

  use {
    'vim-airline/vim-airline',
    requires = {
      {'vim-airline/vim-airline-themes'}
    },
    config = function()
      vim.cmd [[let g:airline#extensions#tabline#enabled = 1]]
      vim.cmd [[let g:airline#extensions#tabline#formatter = 'unique_tail_improved']]
      vim.cmd [[let g:airline#extensions#tabline#show_tab_count = 0]]
      vim.cmd [[let g:airline#extensions#tabline#show_tab_nr = 0]]
      vim.cmd [[let g:airline#extensions#tabline#show_splits = 1]]
      vim.cmd [[let g:airline#extensions#tabline#show_buffers = 1]]
      vim.cmd [[let g:airline#extensions#tabline#show_close_button = 0]]
      vim.cmd [[let g:airline_powerline_fonts = 1]]
    end
  }

  use {
    'RRethy/nvim-base16',
    config = function()
      vim.cmd([[colo base16-gruvbox-light-soft]])

      local colour7 = '#504945'
      local colour8 = '#bdae93'
      local colour9 = '#af3a03'
      local colour10 = '#ebdbb2'

      -- Set vertical dividers to colour10
      vim.cmd(string.format([[highlight VertSplit guibg=none guifg=%s]], colour10))
      -- Set line numbers to colour8
      vim.cmd(string.format([[highlight LineNr guibg=none guifg=%s]], colour8))
      -- Fix Telescope colours
      vim.cmd(string.format([[highlight TelescopeBorder guibg=%s guifg=%s]], colour10, colour10))
      vim.cmd(string.format([[highlight TelescopePromptBorder guibg=%s guifg=%s]], colour10, colour10))
      vim.cmd(string.format([[highlight TelescopeNormal guibg=%s guifg=%s]], colour10, colour7))
      vim.cmd(string.format([[highlight TelescopePromptNormal guibg=%s guifg=%s]], colour10, colour7))
      vim.cmd(string.format([[highlight TelescopeResultsTitle guibg=%s guifg=%s]], colour8, colour7))
      vim.cmd(string.format([[highlight TelescopePromptTitle guibg=%s guifg=%s]], colour8, colour7))
      vim.cmd(string.format([[highlight TelescopePreviewTitle guibg=%s guifg=%s]], colour8, colour7))
      vim.cmd(string.format([[highlight TelescopeSelection guibg=%s guifg=%s gui=bold]], colour8, colour7))
      vim.cmd(string.format([[highlight TelescopePromptPrefix guibg=%s guifg=%s gui=bold]], colour10, colour7))
      vim.cmd(string.format([[highlight TelescopeMatching guibg=none guifg=%s gui=bold]], colour9))
    end
  }
end)
