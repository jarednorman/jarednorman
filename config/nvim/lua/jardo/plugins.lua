-- This snippet installs packer if it's not present:
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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

    use {
        "lazytanuki/nvim-mapper",
        config = function()
            require("nvim-mapper").setup {}
            require("jardo.plugins.nvim-mapper")
        end,
        before = "telescope.nvim"
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = { fuzzy = false }
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
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd([[set background=light]])
            vim.cmd([[colo rose-pine-dawn]])
        end
    }
end)
