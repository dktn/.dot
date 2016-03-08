local mash         = {"ctrl", "cmd"}
local mashShift    = {"ctrl", "cmd", "shift"}
local mashAlt      = {"ctrl", "cmd", "alt"}
local mashAltShift = {"ctrl", "cmd", "alt", "shift"}

hs.window.animationDuration = 0
hs.grid.setMargins({0, 0})
hs.grid.setGrid('12x4')
hs.grid.HINTS = {
  {'f1', 'f2','f3', 'f4', 'f5', 'f6', 'f7', 'f8'},
  {'1', '2', '3', '4', '7', '8', '9', '0'},
  {'Q', 'W', 'F', 'P', 'L', 'U', 'Y', ';'},
  {'A', 'R', 'S', 'T', 'N', 'E', 'I', 'O'},
  {'Z', 'X', 'C', 'V', 'M', ',', '.', '/'}
}

local gw = hs.grid.GRIDWIDTH
local gh = hs.grid.GRIDHEIGHT
local gws = 5
local gwm = 6
local gwb = 7

local gridset = function(x, y, w, h)
    return function()
        local curWindow = hs.window.focusedWindow()
        hs.grid.set(
            curWindow,
            {x=x, y=y, w=w, h=h},
            curWindow:screen()
        )
    end
end


hs.hotkey.bind(mashAltShift, '1', function() hs.layout.apply(internal_display) end)
hs.hotkey.bind(mashAltShift, '2', function() hs.layout.apply(dual_display) end)


hs.hotkey.bind(mashAlt, 'z', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mashAlt, 'h', function() hs.grid.toggleShow() end)
-- hs.hotkey.bind(mash, 'i', function() hs.hints.appHints(appfinder.appFromName("iTerm")) end)

local resizeMash = mashAltShift
-- local resizeKeys = { 'u', 'i', 'o', 'p' } -- Qwerty
-- local resizeKeys = { 'l', 'u', 'y', ';' } -- Colemak
local resizeKeys = { 'left', 'up', 'down', 'right' } -- Arrows
hs.hotkey.bind(resizeMash, resizeKeys[1], hs.grid.resizeWindowThinner)
hs.hotkey.bind(resizeMash, resizeKeys[2], hs.grid.resizeWindowShorter)
hs.hotkey.bind(resizeMash, resizeKeys[3], hs.grid.resizeWindowTaller)
hs.hotkey.bind(resizeMash, resizeKeys[4], hs.grid.resizeWindowWider)

local moveMash = mashAlt
-- local moveKeys = { 'j', 'k', 'l', ';' } -- Qwerty
-- local moveKeys = { 'n', 'e', 'i', 'o' } -- Colemak
local moveKeys = { 'left', 'up', 'down', 'right' } -- Arrows
hs.hotkey.bind(moveMash, moveKeys[1], hs.grid.pushWindowLeft)
hs.hotkey.bind(moveMash, moveKeys[2], hs.grid.pushWindowUp)
hs.hotkey.bind(moveMash, moveKeys[3], hs.grid.pushWindowDown)
hs.hotkey.bind(moveMash, moveKeys[4], hs.grid.pushWindowRight)

local gridMash = mashAlt
-- local gridKeys = { 'q', 'w', 'e', 'r', 't', 'a' } -- Qwerty
local gridKeys = { 'q', 'w', 'f', 'p', 'g', 'a' } -- Colemak
hs.hotkey.bind(gridMash, gridKeys[1], gridset(0,   0, gwm, gh))
hs.hotkey.bind(gridMash, gridKeys[2], gridset(0,   0, gwb, gh))
hs.hotkey.bind(gridMash, gridKeys[3], gridset(gws, 0, gwb, gh))
hs.hotkey.bind(gridMash, gridKeys[4], gridset(gwm, 0, gwm, gh))
hs.hotkey.bind(gridMash, gridKeys[5], gridset(gwb, 0, gws, gh))
hs.hotkey.bind(gridMash, gridKeys[6], hs.grid.maximizeWindow)

-- Launch applications
hs.hotkey.bind(mash, '`', function () hs.application.launchOrFocus("Finder") end)
hs.hotkey.bind(mash, '[', function () hs.application.launchOrFocus("iterm") end)
hs.hotkey.bind(mash, ']', function () hs.application.launchOrFocus("SourceTree") end)
hs.hotkey.bind(mash, '=', function () hs.application.launchOrFocus("Twitter") end)
hs.hotkey.bind(mash, '-', function () hs.application.launchOrFocus("Dash") end)

hs.hotkey.bind(mash, '1', function () hs.application.launchOrFocus("Sublime Text") end)
hs.hotkey.bind(mash, '2', function () hs.application.launchOrFocus("Safari") end)
hs.hotkey.bind(mash, '3', function () hs.application.launchOrFocus("Markdown PLus") end)
hs.hotkey.bind(mash, '4', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(mash, '5', function () hs.application.launchOrFocus("Slack") end)
hs.hotkey.bind(mash, '6', function () hs.application.launchOrFocus("Skim") end)
hs.hotkey.bind(mash, '7', function () hs.application.launchOrFocus("Evernote") end)

hs.hotkey.bind(mashAlt, 'c', function() hs.toggleConsole() end)

-- slow ?
hs.hotkey.bind(mash, 'h', hs.hints.windowHints)

-- slow
hs.hotkey.bind(mashShift, 'left',  function() hs.window.focusedWindow():focusWindowWest()  end)
hs.hotkey.bind(mashShift, 'right', function() hs.window.focusedWindow():focusWindowEast()  end)
hs.hotkey.bind(mashShift, 'up',    function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mashShift, 'down',  function() hs.window.focusedWindow():focusWindowSouth() end)

-- hs.hotkey.bind(mash, 'q', function() Action.MoveToUnit(0.0, 0.0, 0.5, 1.0)(focusedWin()) end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

local internalSpeakers = "Built-in Output"
local externalSpeakers = "Scarlett 18i6 USB"

function setAudioOutput(name)
    local audioDevice = hs.audiodevice.findDeviceByName(name)
    audioDevice:setDefaultOutputDevice()
end

-- Audio Devices
local audioMash = mashAlt
hs.hotkey.bind(audioMash, '1', function () setAudioOutput(internalSpeakers) end)
hs.hotkey.bind(audioMash, '2', function () setAudioOutput(externalSpeakers) end)


function findWindowsByApplicationTitle(title)
    return hs.fnutils.filter(hs.window.allWindows(), function(window)
        return string.match(window:application():title(), title) ~= nil
    end)
end

function moveToSpace(win, space)
  local clickPoint    = win:zoomButtonRect()
  local sleepTime     = 1000
  local longSleepTime = 300000
  local mousePosition = hs.mouse.getAbsolutePosition()

  -- clickPoint.x = clickPoint.x + clickPoint.w + 5
  -- clickPoint.y = clickPoint.y + clickPoint.h / 2
  clickPoint.x = clickPoint.x + clickPoint.w + 10
  clickPoint.y = clickPoint.y - 2

  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, clickPoint):post()
  hs.timer.usleep(sleepTime)
  hs.eventtap.keyStroke({ "ctrl" }, space)
  hs.timer.usleep(longSleepTime)
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, clickPoint):post()
  hs.mouse.setAbsolutePosition(mousePosition)
end


local displayLaptop = "Color LCD"
local displayMonitor = "G257HU"
-- local displayMonitor = "Thunderbolt Display"

local gridMax        = {x=0,   y=0, w=gw,  h=gh}
local gridLeftBig    = {x=0,   y=0, w=gwb, h=gh}
local gridRightSmall = {x=gwb, y=0, w=gws, h=gh}

local internalDisplay = {
    {"iTerm",               0, displayLaptop,  gridMax},
    {"SourceTree",          1, displayLaptop,  gridMax},
    {"Sublime Text",        1, displayLaptop,  gridMax},
    {"Safari",              2, displayLaptop,  gridLeftBig,    "gmail"},
    {"Safari",              2, displayLaptop,  gridRightSmall, "littlegolem"},
    {"Google Chrome",       3, displayLaptop,  gridLeftBig},
    {"Slack",               3, displayLaptop,  gridRightSmall}
}

local dualDisplay = {
    {"iTerm",               0, displayLaptop,  gridMax},
    {"SourceTree",          1, displayLaptop,  gridMax},
    {"Sublime Text",        1, displayMonitor, gridMax},
    {"Safari",              2, displayMonitor, gridLeftBig,    "gmail"},
    {"Safari",              2, displayMonitor, gridRightSmall, "littlegolem"},
    {"Google Chrome",       3, displayMonitor, gridLeftBig},
    {"Slack",               3, displayMonitor, gridRightSmall}
}

function setupWindows()
    local sleepTime     =  100000
    local sleepTimeLong =  500000
    local focusedApp    = hs.application.frontmostApplication():name()
    screens = #hs.screen.allScreens()
    print("Screens ", screens)
    local display = screens == 1 and internalDisplay or dualDisplay
    -- print (display[2][3])
    for i, v in ipairs(display) do
        local appName = v[1]
        local space   = v[2]
        local screen  = v[3]
        local grid    = v[4]
        local winName = v[5]
        -- print(i, appName, space, screen, grid)
        hs.application.launchOrFocus(appName)
        hs.timer.usleep(sleepTime)
        local app = hs.application.find(appName)
        if app ~= nil then
            -- print("app ", app)
            local window = winName == nil and app:mainWindow() or app:findWindow(winName)
            -- print("window ", window)
            if window ~= nil then
                if space ~= 0 then
                    moveToSpace(window, space)
                    -- print("space ", space)
                    hs.timer.usleep(sleepTimeLong)
                end
                hs.grid.set(window, grid, screen)
                hs.timer.usleep(sleepTime)
            end
        end
    end
    hs.application.launchOrFocus(focusedApp)
end

hs.hotkey.bind(mashAltShift, 'r', function () setupWindows() end)
