local MODS = { "ctrl", "alt", "cmd" }

hs.window.animationDuration = 0

-- Width (in points) for a 120-column Ghostty window on the right side of the
-- 3008x1692pt display, keeping padding balanced across all four edges:
--   MonoLisa 16 -> cell 20x44px (10x22pt at 2x)
--   height 3384px -> 76 rows (3344px), padding 20px top / 20px bottom (10pt)
--   width  2440px (1220pt) -> 120 cols (2400px), padding 20px left / 20px right (10pt)
-- Primary work area takes the remaining 1788pt on the left.
local TERMINAL_WIDTH = 1220

local function focusedWindow()
    local win = hs.application.frontmostApplication():focusedWindow()
    if not win then return nil end
    local screen = win:screen()
    if not screen then return nil end
    return win, screen
end

local function primaryArea(frame)
    return {
        x = frame.x,
        y = frame.y,
        w = frame.w - TERMINAL_WIDTH,
        h = frame.h,
    }
end

local function terminalArea(frame)
    return {
        x = frame.x + frame.w - TERMINAL_WIDTH,
        y = frame.y,
        w = TERMINAL_WIDTH,
        h = frame.h,
    }
end

local function snapToTerminalArea(win)
    if not win then return end
    local screen = win:screen()
    if not screen then return end
    win:setFrame(terminalArea(screen:frame()))
end

-- Auto-position Ghostty windows into the right-side terminal area on creation.
GhosttyWindowFilter = hs.window.filter.new("Ghostty")
GhosttyWindowFilter:subscribe(hs.window.filter.windowCreated, function(win)
    snapToTerminalArea(win)
    hs.timer.doAfter(0.05, function()
        if win and win:isStandard() then
            snapToTerminalArea(win)
        end
    end)
end)

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

-- Fill the primary area on the left side of the screen.
hs.hotkey.bind(MODS, "i", function()
    local win, screen = focusedWindow()
    if not win then return end

    win:setFrame(primaryArea(screen:frame()))
end)

-- Centre the focused window within the primary area on the left.
hs.hotkey.bind(MODS, "o", function()
    local win, screen = focusedWindow()
    if not win then return end

    local area = primaryArea(screen:frame())
    local f = win:frame()
    win:setTopLeft({
        x = math.floor(area.x + (area.w - f.w) / 2),
        y = math.floor(area.y + (area.h - f.h) / 2),
    })
end)

-- Fill the terminal area on the right side of the screen.
hs.hotkey.bind(MODS, "h", function()
    local win = focusedWindow()
    snapToTerminalArea(win)
end)
