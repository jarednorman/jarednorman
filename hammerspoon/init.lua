local padding = 16
local columnWidth = 775
local topSplitRatio = 0.6

local function getFrames()
    local win = hs.application.frontmostApplication():focusedWindow()
    if not win then return end
    local screen = win:screen()
    if not screen then return end

    local frame = screen:frame()
    local padded = {
        x = frame.x + padding,
        y = frame.y + padding,
        w = frame.w - 2 * padding,
        h = frame.h - 2 * padding,
    }

    local maxLeft = math.max(0, padded.w - padding)
    local lw = math.min(columnWidth, maxLeft)

    local right = {
        x = padded.x + padded.w - lw,
        y = padded.y,
        w = lw,
        h = padded.h,
    }

    local iHeight = math.floor((right.h - padding) * topSplitRatio)
    if iHeight < 0 then iHeight = 0 end

    local iRect = {
        x = right.x,
        y = right.y,
        w = right.w,
        h = iHeight,
    }

    local oRect = {
        x = right.x,
        y = right.y + iHeight + padding,
        w = right.w,
        h = math.max(0, right.h - iHeight - padding),
    }

    local nRect = {
        x = padded.x,
        y = padded.y,
        w = math.max(0, padded.w - right.w - padding),
        h = padded.h,
    }

    local function toIntRect(rect)
        return {
            x = math.floor(rect.x),
            y = math.floor(rect.y),
            w = math.floor(rect.w),
            h = math.floor(rect.h),
        }
    end

    return win, toIntRect(iRect), toIntRect(oRect), toIntRect(nRect)
end

local function bindHotkey(key, rectSelector)
    hs.hotkey.bind({ "ctrl", "alt", "cmd" }, key, function()
        local win, iRect, oRect, nRect = getFrames()
        if not win then return end
        local rect = rectSelector(iRect, oRect, nRect)
        if rect then
            win:setFrame(rect)
        end
    end)
end

bindHotkey("i", function(iRect)
    return iRect
end)

bindHotkey("o", function(_, oRect)
    return oRect
end)

bindHotkey("n", function(_, _, nRect)
    return nRect
end)

hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "y", function()
    local win, _, _, nRect = getFrames()
    if not win or not nRect then return end
    local f = win:frame()
    local x = math.floor(nRect.x + (nRect.w - f.w) / 2)
    local y = math.floor(nRect.y + (nRect.h - f.h) / 2)
    local maxX = nRect.x + nRect.w - f.w
    local maxY = nRect.y + nRect.h - f.h
    local newFrame = {
        x = math.max(nRect.x, math.min(x, maxX)),
        y = math.max(nRect.y, math.min(y, maxY)),
        w = f.w,
        h = f.h,
    }
    win:setFrame(newFrame)
end)
