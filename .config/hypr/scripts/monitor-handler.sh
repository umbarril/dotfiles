#!/bin/bash

function handle {
  if [[ $line == "monitoradded>>"* ]]; then
    echo "New display detected, sleeping for a few seconds..."
    sleep 15s
    echo "Reloading Waybar..."
    # completely arbitrary delay or else this will not have effect
    killall waybar
    setsid waybar
  fi
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done

