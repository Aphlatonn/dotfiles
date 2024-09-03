-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")

-- text widget function
local function create_text(text)
	local separator = wibox.widget.textbox()
	separator:set_text(text)
	return separator
end

-- Keyboard layout widget function
local function create_keyboardlayout_widget()
	return awful.widget.keyboardlayout()
end

-- Clock widget function
local function create_clock_widget()
	return wibox.widget.textclock("󱑃 %H:%M")
end

-- Date widget function
local function create_date_widget()
	return wibox.widget.textclock(" %Y/%m/%d")
end

-- Battery widget function
local function create_battery_widget()
	return awful.widget.watch('bash -c "cat /sys/class/power_supply/BAT0/capacity"', 30, function(widget, stdout)
		local battery_level = tonumber(stdout)
		widget:set_text(" " .. battery_level .. "%")
	end)
end

-- Create wibox for each screen
awful.screen.connect_for_each_screen(function(s)
	-- Create widgets
	local separator = create_text("  ")
	local keyboardlayout_widget = create_keyboardlayout_widget()
	local clock_widget = create_clock_widget()
	local date_widget = create_date_widget()
	local battery_widget = create_battery_widget()

	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = gears.table.join(
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({ modkey }, 1, function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
				if client.focus then
					client.focus:toggle_tag(t)
				end
			end),
			awful.button({}, 4, function(t)
				awful.tag.viewnext(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewprev(t.screen)
			end)
		),
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = gears.table.join(
			awful.button({}, 1, function(c)
				if c == client.focus then
					c.minimized = true
				else
					c:emit_signal("request::activate", "tasklist", { raise = true })
				end
			end),
			awful.button({}, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end),
			awful.button({}, 4, function()
				awful.client.focus.byidx(1)
			end),
			awful.button({}, 5, function()
				awful.client.focus.byidx(-1)
			end)
		),
	})

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		visible = true,
		type = "dock",
		height = 18, -- Adjust the height for horizontal wibox
		width = s.geometry.width, -- Adjust the width for vertical wibox
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			keyboardlayout_widget,
			date_widget,
			separator,
			clock_widget,
			separator,
			battery_widget,
			separator,
			wibox.widget.systray(),
			s.mylayoutbox,
		},
	})
end)
