hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({"alt"}, "c", function()
  hs.application.frontmostApplication():focusedWindow():centerOnScreen()
end)

local hotkey = function(index, applicationName)
 hs.hotkey.bind({"alt"}, index, function()
   hs.application.get(applicationName):activate()
 end)
end

hotkey("1", "Google Chrome")
hotkey("2", "kitty")
hotkey("3", "Slack")
hotkey("4", "Obsidian")
hotkey("5", "Linear")
