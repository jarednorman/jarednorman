local function bindPosition(key, fraction)
    hs.hotkey.bind({ "ctrl", "alt", "cmd" }, key, function()
        local win = hs.application.frontmostApplication():focusedWindow()
        if not win then return end
        local screen = win:screen()
        if not screen then return end

        -- screen:frame() excludes the menubar and dock
        local frame = screen:frame()
        local f = win:frame()
        win:setTopLeft({
            x = math.floor(frame.x + frame.w * fraction - f.w / 2),
            y = frame.y,
        })
    end)
end

bindPosition("y", 0.25)
bindPosition("n", 0.5)
bindPosition("i", 0.75)
