#!/bin/sh

BASE_DIR="$HOME/Pictures/Wallpapers/"
WALLPAPER=$(ls "$BASE_DIR" | sort -R | tail -1)

FULL_PATH="$BASE_DIR$WALLPAPER"

rm $HOME/.current-wallpaper 
ln -s "$FULL_PATH" $HOME/.current-wallpaper 

swww img $FULL_PATH --transition-step 60 --transition-type grow

