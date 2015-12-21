
local mash       = {"ctrl", "cmd"}
local mash_app   = {"ctrl", "cmd"}
local mash_shift = {"ctrl", "cmd", "shift"}
local mash2      = {"ctrl", "cmd", "alt"}

-- hotkey.bind(mash, "d", function()
--   local win = window.focusedwindow()
--   local f = win:frame()
--   f.x = f.x + 10
--   win:setframe(f)
-- end)

-- hotkey.bind(mash, "c", mjolnir.openconsole)


-- hs.hotkey.bind(mash2, "l",    function() tiling.cyclelayout() end)
-- hs.hotkey.bind(mash, "space", function() tiling.promote() end)
-- hs.otkey.bind(mash, "j",      function() tiling.cycle(1) end)
-- hhs.otkey.bind(mash, "k",     function() tiling.cycle(-1) end)

-- tiling.set('layouts', {
--   'fullscreen', 'main-vertical'
-- })



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
local gm = gw / 2
local gb = 7
local gs = 5


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


hs.hotkey.bind(mash, 'n', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'k', hs.grid.maximizeWindow)
hs.hotkey.bind(mash, 'h', function() hs.grid.toggleShow() end)
-- hs.hotkey.bind(mash, 'i', function() hs.hints.appHints(appfinder.appFromName("iTerm")) end)

hs.hotkey.bind(mash, 'l', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, 'u', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mash, 'y', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, ';', hs.grid.resizeWindowWider)

-- Launch applications
hs.hotkey.bind(mash_app, '`', function () hs.application.launchOrFocus("iterm") end)
hs.hotkey.bind(mash_app, '1', function () hs.application.launchOrFocus("Sublime Text 2") end)
hs.hotkey.bind(mash_app, '2', function () hs.application.launchOrFocus("Safari") end)
hs.hotkey.bind(mash_app, '3', function () hs.application.launchOrFocus("SourceTree") end)
hs.hotkey.bind(mash_app, '4', function () hs.application.launchOrFocus("Slack") end)
hs.hotkey.bind(mash_app, '5', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(mash_app, '6', function () hs.application.launchOrFocus("Finder") end)



-- slow
hs.hotkey.bind(mash2, 'h', hs.hints.windowHints)
-- slow
hs.hotkey.bind(mash_shift, 'left',  function() hs.window.focusedWindow():focusWindowWest()  end)
hs.hotkey.bind(mash_shift, 'right', function() hs.window.focusedWindow():focusWindowEast()  end)
hs.hotkey.bind(mash_shift, 'up',    function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mash_shift, 'down',  function() hs.window.focusedWindow():focusWindowSouth() end)

-- hs.hotkey.bind(mash, 'q', function() Action.MoveToUnit(0.0, 0.0, 0.5, 1.0)(focusedWin()) end)

hs.hotkey.bind(mash, 'q', gridset(0,  0, gm, gh))
hs.hotkey.bind(mash, 'w', gridset(0,  0, gb, gh))
hs.hotkey.bind(mash, 'f', gridset(gs, 0, gb,  gh))
hs.hotkey.bind(mash, 'p', gridset(gm, 0, gm, gh))
hs.hotkey.bind(mash, 'g', gridset(gb, 0, gs,  gh))



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
