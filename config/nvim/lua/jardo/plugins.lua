-- This snippet installs packer if it's not present:
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'christoomey/vim-tmux-navigator'

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
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require("telescope").load_extension("mapper") end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() vim.cmd [[TSUpdate]] end,
    config = function() require('jardo.plugins.treesitter') end
  }

  use {
    'sainnhe/edge',
    config = function() vim.cmd [[colorscheme edge]] end
  }
end)
