hs.loadSpoon('ControlEscape'):start()

local hotkey = function(index, applicationName)
  hs.hotkey.bind({"alt"}, index, function()
    hs.application.get(applicationName):activate()
  end)
end

hotkey("1", "Google Chrome")
hotkey("2", "kitty")
hotkey("3", "Obsidian")
hotkey("4", "Slack")
