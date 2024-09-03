-- import needed libraries
local awful = require("awful")

-- once
awful.spawn.once("nm-applet")
awful.spawn.once("picom")

-- spawn
-- awful.spawn.with_shell("notify-send hello")
