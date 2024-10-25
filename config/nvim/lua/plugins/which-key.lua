return {
  'nvim-tree/nvim-web-devicons',
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    init = function()
      require("which-key").add({
        { "<leader><leader>", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find File", mode = "n" },
        { "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Grep Codebase", mode = "n" },
        { "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Find Buffer", mode = "n" },
        { "<leader>/", '<cmd>let @/=""<cr>', desc = "Clear Search", mode = "n" },
        { "<leader>t", '<cmd>tabnew<cr>', desc = "New Tab", mode = "n" },
        { "<leader><tab>", '<cmd>tabnext<cr>', desc = "Next Tab", mode = "n" },
        { "<leader><s-tab>", '<cmd>tabprev<cr>', desc = "Previous Tab", mode = "n" },
        { "<leader>f", '<cmd>let @* = expand("%")<cr>', desc = "Copy Filename", mode = "n" },
        { "<leader>n", '<cmd>tabd windo set invnumber<cr>', desc = "Toggle Line Numbers", mode = "n" },
        { "<leader>c", '<cmd>ccl<cr>', desc = "Close Quickfix Window", mode = "n" },
      })
    end
  }
}
