local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local search_gem = function(gem_name)
  local path = vim.fn.systemlist("bundle info --path " .. gem_name)[1]

  pickers.new({}, {
    prompt_title = "files in gem: " .. gem_name,
    sorter = conf.generic_sorter(opts),
    finder = finders.new_oneshot_job({"find", ".", "-type", "f"}, {
      cwd = path,
      entry_maker = function(entry)
        return {
          value = path .. "/" .. entry,
          display = entry:sub(3),
          ordinal = entry:sub(3)
        }
      end
    }),
  }):find()
end

local gems = function()
  opts = require("telescope.themes").get_dropdown{}

  pickers.new(opts, {
    prompt_title = "gems in project",
    sorter = conf.generic_sorter(opts),
    finder = finders.new_oneshot_job({"bundle", "list", "--name-only"}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)

        local selection = action_state.get_selected_entry()

        -- For debugging:
        -- print(vim.inspect(selection))

        search_gem(selection[1])
      end)

      return true
    end,
  }):find()
end

gems()
