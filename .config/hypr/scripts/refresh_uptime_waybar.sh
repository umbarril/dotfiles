while true; do
    sleep 12h 
    killall waybar
    setsid waybar &
done
