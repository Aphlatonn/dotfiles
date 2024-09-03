#!/bin/sh

# The wallpapers directory
dir="$HOME/Pictures/"

# Get the wallpaper file using nsxiv (sxiv fork)
wallpaper=$(nsxiv -o -t "$dir")

# Check if a wallpaper was selected
[ -z "$wallpaper" ] && { echo "No wallpaper selected."; exit 1; }

# Copy the selected wallpaper to ~/.cache/wall.jpg
cache_dir="$HOME/.cache"
cache_wall="$cache_dir/wall.jpg"

# Create the cache directory if it doesn't exist
[ ! -d "$cache_dir" ] && mkdir -p "$cache_dir"

# Copy the wallpaper
cp "$wallpaper" "$cache_wall"

# Use awesome-client to set the wallpaper
echo "local gears = require('gears'); for s in screen do gears.wallpaper.maximized('$cache_wall', s, true) end" | awesome-client

echo "Wallpaper set and copied to $cache_wall"

