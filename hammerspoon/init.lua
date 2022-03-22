hs.loadSpoon('ControlEscape'):start()

-- hs.hotkey.bind({"alt"}, "c", function()
--   hs.application.frontmostApplication():focusedWindow():centerOnScreen()
-- end)

local hotkey = function(index, applicationName)
  hs.hotkey.bind({"alt"}, index, function()
    hs.application.get(applicationName):activate()
  end)
end

hotkey("1", "Todoist")
hotkey("2", "Obsidian")
hotkey("3", "kitty")
hotkey("4", "Google Chrome")
hotkey("5", "Slack")
