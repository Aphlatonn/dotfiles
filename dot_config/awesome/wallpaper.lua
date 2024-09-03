-- Load the gears module
local gears = require("gears")
local beautiful = require("beautiful")

-- Set the wallpaper function
local function set_wallpaper(s)
	-- If wallpaper is a function, call it with the screen
	if type(beautiful.wallpaper) == "function" then
		beautiful.wallpaper = beautiful.wallpaper(s)
	end

	-- Set the wallpaper
	gears.wallpaper.maximized(os.getenv("HOME") .. "/.cache/wall.jpg", s, true)
end

-- Set wallpaper for each screen
screen.connect_signal("property::geometry", set_wallpaper)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
for s in screen do
	set_wallpaper(s)
end
