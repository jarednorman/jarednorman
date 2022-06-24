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
    'RRethy/nvim-base16',
    config = function()
      vim.cmd [[colo base16-gruvbox-light-medium]]
      -- Set vertical dividers to colour10
      vim.cmd [[highlight VertSplit guibg=none guifg=#ebdbb2]]
      -- Set line numbers to colour8
      vim.cmd [[highlight LineNr guibg=none guifg=#bdae93]]
      -- Fix Telescope colours
      vim.cmd [[highlight TelescopeBorder guibg=#ebdbb2 guifg=#ebdbb2]]
      vim.cmd [[highlight TelescopePromptBorder guibg=#ebdbb2 guifg=#ebdbb2]]
      vim.cmd [[highlight TelescopeNormal guibg=#ebdbb2 guifg=#504945]]
      vim.cmd [[highlight TelescopePromptNormal guibg=#ebdbb2 guifg=#504945]]
      vim.cmd [[highlight TelescopeResultsTitle guibg=#bdae93 guifg=#504945]]
      vim.cmd [[highlight TelescopePromptTitle guibg=#bdae93 guifg=#504945]]
      vim.cmd [[highlight TelescopePreviewTitle guibg=#bdae93 guifg=#504945]]
      vim.cmd [[highlight TelescopeSelection guibg=#bdae93 guifg=#504945 gui=bold]]
      vim.cmd [[highlight TelescopePromptPrefix guibg=#ebdbb2 guifg=#504945 gui=bold]]
      vim.cmd [[highlight TelescopeMatching guibg=none guifg=#af3a03 gui=bold]]
    end
  }
end)
