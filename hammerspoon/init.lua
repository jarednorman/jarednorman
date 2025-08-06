local MODS = { "ctrl", "alt", "cmd" }

-- Screen x (in points) of the tmux divider line right of the 110-column
-- claude pane, in Ghostty fullscreen on the 3008pt-wide display:
--   cell width   8.5pt (MonoLisa 14, 17px at 2x)
--   grid padding (3008 - 353 * 8.5) / 2 = 3.75pt
--   divider cell starts at 3.75 + 110 * 8.5 = 938.75pt, its centre is 943pt
local TMUX_DIVIDER_X = 942

local function focusedWindow()
    local win = hs.application.frontmostApplication():focusedWindow()
    if not win then return nil end
    local screen = win:screen()
    if not screen then return nil end
    return win, screen
end

-- Horizontally centre the focused window on the screen.
hs.hotkey.bind(MODS, "n", function()
    local win, screen = focusedWindow()
    if not win then return end

    -- screen:frame() excludes the menubar and dock
    local frame = screen:frame()
    local f = win:frame()
    win:setTopLeft({
        x = math.floor(frame.x + (frame.w - f.w) / 2),
        y = frame.y,
    })
end)

-- Fill the screen from the tmux divider to the right edge.
hs.hotkey.bind(MODS, "i", function()
    local win, screen = focusedWindow()
    if not win then return end

    local frame = screen:frame()
    local x = frame.x + TMUX_DIVIDER_X
    win:setFrame({ x = x, y = frame.y, w = frame.x + frame.w - x, h = frame.h })
end)

-- Centre the focused window between the tmux divider and the right edge.
hs.hotkey.bind(MODS, "o", function()
    local win, screen = focusedWindow()
    if not win then return end

    local frame = screen:frame()
    local left = frame.x + TMUX_DIVIDER_X
    local f = win:frame()
    win:setTopLeft({
        x = math.floor(left + (frame.x + frame.w - left - f.w) / 2),
        y = math.floor(frame.y + (frame.h - f.h) / 2),
    })
end)
