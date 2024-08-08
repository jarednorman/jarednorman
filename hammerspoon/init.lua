hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({"alt"}, "c", function()
  hs.application.frontmostApplication():focusedWindow():centerOnScreen()
end)

local hotkey = function(index, applicationName)
 hs.hotkey.bind({"alt"}, index, function()
   hs.application.get(applicationName):activate()
 end)
end

hotkey("1", "Firefox Developer Edition")
hotkey("2", "Zed")
hotkey("3", "kitty")
hotkey("4", "Todoist")
hotkey("5", "Obsidian")
hotkey("6", "Slack")
