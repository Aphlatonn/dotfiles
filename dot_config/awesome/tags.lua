local awful = require("awful")

-- ================ Screen 1 tags ================
awful.tag.add(_, {
	name = "1", -- The tag name
	id = "1", -- The tap id
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = true, -- Make this tag the selected one on startup
	gap_single_client = true,
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "2", -- The Tag name
	id = "2", -- The tag name
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true,
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "3",
	id = "3",
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true,
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "4", -- The tag name
	id = "4", -- The tag id
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true, -- Set to false if you want to remove gaps if only one window is opened
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "5", -- The tag name
	id = "5", -- The tag id
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true, -- Set to false if you want to remove gaps if only one window is opened
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "6", -- The tag name
	id = "6", -- The tag id
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true, -- Set to false if you want to remove gaps if only one window is opened
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "7", -- The tag name
	id = "7", -- The tag id
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true, -- Set to false if you want to remove gaps if only one window is opened
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "8", -- The tag name
	id = "8", -- The tag id
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true, -- Set to false if you want to remove gaps if only one window is opened
	-- master_width_factor = 0.6,
})

awful.tag.add(_, {
	name = "9", -- The tag name
	id = "9", -- The tag id
	screen = screen[1], -- Assign the tag to the first screen
	layout = awful.layout.suit.tile, -- Set a specific layout for the tag
	gap = 2, -- Set gaps between clients in the tag
	selected = false, -- Make this tag the selected one on startup
	gap_single_client = true, -- Set to false if you want to remove gaps if only one window is opened
	-- master_width_factor = 0.6,
})

-- Create a hidden scratchpad tag (workspace)
awful.tag.add("", {
	name = "[]=", -- The tag name
	screen = awful.screen.focused(),
	layout = awful.layout.suit.tile,
	selected = false,
	gap_single_client = true,
	hidden = true, -- This hides the tag from the workspace widget
})
