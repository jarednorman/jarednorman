hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({"alt"}, "c", function()
  hs.application.frontmostApplication():focusedWindow():centerOnScreen()
end)

-- Okay, I'll admit that I never actually got in the habit of using any of
-- these. Sad, as I'd really like to.
--
-- local hotkey = function(index, applicationName)
--   hs.hotkey.bind({"alt"}, index, function()
--     hs.application.get(applicationName):activate()
--   end)
-- end
-- 
-- hotkey("1", "Obsidian")
-- hotkey("1", "Reminders")
-- hotkey("3", "kitty")
-- hotkey("4", "Google Chrome")
-- hotkey("5", "Slack")
