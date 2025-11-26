hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "n", function()
    local win = hs.application.frontmostApplication():focusedWindow()

    win:setSize({
        w = 1397,
        h = 793
    })

    win:centerOnScreen()
end)
