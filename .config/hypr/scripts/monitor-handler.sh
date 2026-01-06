#!/bin/bash

function handle {
  if [[ $line == "monitoradded>>"* ]]; then
    echo "New display detected, sleeping for a few seconds..."
    sleep 15s # completely arbitrary delay or else this will not have effect
    echo "Reloading Waybar..."
    killall waybar
    setsid waybar
    echo "Reloading wallpaper..."
    swww img $HOME/.current-wallpaper --transition-step 60 --transition-type grow
  fi
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done

