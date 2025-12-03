hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "n", function()
    local win = hs.application.frontmostApplication():focusedWindow()
    local screen = win:screen()
    -- Get the usable frame (excludes menubar and dock)
    local frame = screen:frame()

    local w = 1464
    local h = 894

    win:setFrame({
        x = frame.x + (frame.w - w) / 2,
        y = frame.y + (frame.h - h) / 2,
        w = w,
        h = h
    })
end)
