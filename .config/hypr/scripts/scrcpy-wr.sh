#!/bin/bash

# This script is a wrapper for scrcpy to open it in a new Hyprland window.
# It uses socat to listen for commands from Hyprland and opens scrcpy in a new window.
# It sets the window size to an appropriate size depending on the screen resolution of the phone.
# That is to make sure that the window is not too small or too big and fits well on the screen while not leaving black borders.
function handle {
  if [[ ${1:0:10} == "openwindow" ]] && [[ $1 == *"scrcpy"* ]]; then
    # Get the screen resolution of the phone
    resolution=$(adb shell wm size | awk '{print $3}')
    width=$(echo $resolution | cut -d 'x' -f 1)
    height=$(echo $resolution | cut -d 'x' -f 2)

    # Calculate the window size based on the screen resolution
    if [[ $width -gt $height ]]; then
      window_width=$((width / 2))
      window_height=$((height / 2))
    else
      window_width=$((width / 2))
      window_height=$((height / 2))
    fi

    # Resizing the window to the calculated size (TODO)
  fi
}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
