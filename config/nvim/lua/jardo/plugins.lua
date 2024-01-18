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
    "neovim/nvim-lspconfig",
    config = function()
      require'lspconfig'.tsserver.setup {}
      require'lspconfig'.ruby_ls.setup{}
      require'lspconfig'.rescriptls.setup{}

      -- Use LspAttach autocommand to only map the following keys after the
      -- language server attaches to the current buffer.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end,
      })
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
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.cmd([[set background=dark]])
      vim.cmd([[colo catppuccin]])
    end
  }
end)
