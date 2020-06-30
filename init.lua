-- Install and load Spoons
hs.loadSpoon("SpoonInstall")
spoon.use_syncinstall = true
spoon.SpoonInstall:andUse("Caffeine")

-- Caffeinate toggle in menu bar.
spoon.Caffeine:start()




local hyper = { "cmd", "ctrl", "alt",  "shift" }

-- Add a screen lock shortcut.
hs.hotkey.bind(hyper, 'L', function()
  hs.caffeinate.lockScreen()
end)


hs.alert.defaultStyle.strokeColor = {white = 1, alpha = 0}
hs.alert.defaultStyle.fillColor = {white = 0.05, alpha = 0.75}
hs.alert.defaultStyle.radius = 10
hs.window.animationDuration = 0


  hs.hotkey.bind(hyper, "Left", function()
    local win = hs.window.focusedWindow();
    if not win then return end
  win:moveToUnit(hs.layout.left50)
  end)
  hs.hotkey.bind(hyper, "Up", function()
    local win = hs.window.focusedWindow();
    if not win then return end
  win:moveToUnit(hs.layout.maximized)
  end)
  hs.hotkey.bind(hyper, "Right", function()
    local win = hs.window.focusedWindow();
    if not win then return end
  win:moveToUnit(hs.layout.right50)
  end)
  hs.hotkey.bind(hyper, "Down", function()
    local win = hs.window.focusedWindow();
    if not win then return end
  win:minimize()
  end)

-- left, upper corner
hs.hotkey.bind(hyper, "4", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x / 2
  f.y = max.y / 2
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)


-- Right, lower corner
hs.hotkey.bind(hyper, "2", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)



-- Right upper corner
hs.hotkey.bind(hyper, "1", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()


  f.x = max.x + (max.w / 2)
  f.y = max.y / 2
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)
-- Left lower corner
hs.hotkey.bind(hyper, "3", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x / 2
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

  local applicationHotkeys = {
    c = 'Google Chrome',
    s = 'Spotify',
    t = "iTerm",
    v = "Visual Studio Code",
    m = "Mail",
    f = "Finder",
    a = "Activity Monitor",
    b = "Bitwarden",
    z = "zoom.us",
    d = "discord",
    i = "IntelliJ IDEA CE",
    r = "Reminders",
    y = "PyCharm CE with Anaconda Plugin",
    l = "League of Legends",
    w = "Preview",
    q = "Quicktime Player"

  }
  for key, app in pairs(applicationHotkeys) do
    hs.hotkey.bind(hyper, key, function()
      hs.application.launchOrFocus(app)
    end)
  end

  function pingResult(object, message, seqnum, error)
    local seconds = 2
    if message == "didFinish" then
        avg = tonumber(string.match(object:summary(), '/(%d+.%d+)/'))
        if avg == 0.0 then
            hs.alert.show("No network", seconds)
        elseif avg < 200.0 then
            hs.alert.show("Network good (" .. avg .. "ms)", seconds)
        elseif avg < 500.0 then
            hs.alert.show("Network poor(" .. avg .. "ms)", seconds)
        else
            hs.alert.show("Network bad(" .. avg .. "ms)", seconds)
        end
    end
end


  hs.hotkey.bind(hyper, 'space', function()
    local seconds = 2
    local message = os.date("%I:%M%p") .. "\n" .. os.date("%a %b %d") .. "\nBattery: " ..
       hs.battery.percentage() .. "%"
    hs.alert.show(message, seconds)
    hs.network.ping.ping("8.8.8.8", 1, 0.01, 1.0, "any", pingResult)
  end)

  hs.hotkey.bind(hyper, "DELETE", function()
    hs.caffeinate.lockScreen()
  end)


  hs.hotkey.bind(hyper, 'p', hs.spotify.playpause)
  hs.hotkey.bind(hyper, ']', hs.spotify.next)
  hs.hotkey.bind(hyper, '[', hs.spotify.previous)

  






  hs.alert.show('Hammerspoon Config Loaded', 1)