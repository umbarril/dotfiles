#!/usr/bin/env bash

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi


# Detect monitor mon_height and scaling factor
mon_height=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height / .scale' | awk -F'.' '{print $1}')
mon_width=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .width / .scale' | awk -F'.' '{print $1}')
hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')

if [ $mon_width -eq 1366 ] && [ $mon_height -eq 768 ]; then
    # using 1366x768 values as base for scaling
    A_1366=300
    B_1366=300
    wlogout -C $HOME/.config/wlogout/nova.css -l $HOME/.config/wlogout/layout --protocol layer-shell -b 5 -T $(awk "BEGIN {printf \"%.0f\", $A_1366 * $hypr_scale}") -B $(awk "BEGIN {printf \"%.0f\", $B_1366 * $hypr_scale}") &

    exit 0
fi

# using 1080p values as base for scaling
A_1080=400
B_1080=400

wlogout -C $HOME/.config/wlogout/nova.css -l $HOME/.config/wlogout/layout --protocol layer-shell -b 5 -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $mon_height}") -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") &

