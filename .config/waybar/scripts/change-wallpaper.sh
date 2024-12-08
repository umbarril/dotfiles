#!/bin/sh

BASE_DIR="$HOME/Pictures/Wallpapers/"

WALLPAPER=$(ls -N $BASE_DIR | while read A ; do  echo -en "$A\x00icon\x1f$BASE_DIR$A\n"; done | rofi -dmenu -theme-str 'element-icon { size: 2.0em;}')

if [[ -z $WALLPAPER ]]; then
    exit
fi

FULL_PATH="$BASE_DIR$WALLPAPER"
rm $HOME/.current-wallpaper 
ln -s "$FULL_PATH" $HOME/.current-wallpaper 

swww img "$FULL_PATH" --transition-fps 60 --transition-type grow

