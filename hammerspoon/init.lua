hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "n", function()
    local win = hs.application.frontmostApplication():focusedWindow()
    local screen = win:screen()
    -- Get the usable frame (excludes menubar and dock)
    local frame = screen:frame()

    local w = 1397
    local h = 851

    win:setFrame({
        x = frame.x + (frame.w - w) / 2,
        y = frame.y + (frame.h - h) / 2,
        w = w,
        h = h
    })
end)
