#!/bin/sh

BASE_DIR="$HOME/Pictures/Wallpapers/"

WALLPAPER=$(ls -N $BASE_DIR | while read A ; do  echo -en "$A\0icon\x1fthumbnail://$BASE_DIR$A\n"; done | rofi -dmenu -show-icons -theme-str 'element-icon { size: 2.0em;}')
# WALLPAPER=$(ls -N $BASE_DIR | while read A ; do  echo -en "$A\x00icon\x1f$BASE_DIR$A\n"; done | rofi -dmenu -theme-str 'element-icon { size: 2.0em;}')

if [[ -z $WALLPAPER ]]; then
    exit
fi

FULL_PATH="$BASE_DIR$WALLPAPER"
rm $HOME/.current-wallpaper 
ln -s "$FULL_PATH" $HOME/.current-wallpaper 

swww img "$FULL_PATH" --transition-fps 60 --transition-type grow

# wait a bit for transition to happen..
sleep 1.0

wal -i "$FULL_PATH"     # reload pywal colors
killall -SIGUSR2 waybar # and reload everything that uses pywal colors vvvv
killall -SIGUSR1 kitty  # kitty has to have allow_remote_control=yes in its config for this to work
