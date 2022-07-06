hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({"alt"}, "c", function()
  hs.application.frontmostApplication():focusedWindow():centerOnScreen()
end)

local hotkey = function(index, applicationName)
 hs.hotkey.bind({"alt"}, index, function()
   hs.application.get(applicationName):activate()
 end)
end

hotkey("1", "kitty")
hotkey("a", "kitty")
hotkey("2", "Google Chrome")
hotkey("s", "Google Chrome")
hotkey("3", "Slack")
hotkey("e", "Slack")
hotkey("4", "Obsidian")
hotkey("t", "Obsidian")
