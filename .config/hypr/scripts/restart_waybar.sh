#!/bin/bash

# Find the Waybar config file (adjust the path if necessary)
CONFIG_PATH="$HOME/.config/waybar/config.jsonc"

# Ensure the config file exists
if [[ ! -f "$CONFIG_PATH" ]]; then
    echo "Error: Waybar config file not found at $CONFIG_PATH"
    exit 1
fi

# Watch the config file for changes and restart Waybar
echo "$HOME/.config/waybar/config.jsonc" | entr -pr bash -c 'killall waybar && setsid waybar &'

