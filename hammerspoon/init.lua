hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({"alt"}, "c", function()
  hs.application.frontmostApplication():focusedWindow():centerOnScreen()
end)

local hotkey = function(index, applicationName)
 hs.hotkey.bind({"alt"}, index, function()
   hs.application.get(applicationName):activate()
 end)
end

hotkey("1", "Obsidian")
hotkey("2", "Google Chrome")
hotkey("3", "kitty")
hotkey("4", "Slack")
hotkey("5", "Linear")
