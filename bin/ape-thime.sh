#!/bin/sh

keepassxc --lock

hyprctl clients -j | jq -r '.[] | select(.class == "firefox" and (.title | test("Private Browsing"))) | .address' | xargs -I{} hyprctl dispatch closewindow "address:{}"
if [ $? -eq 0 ]; then
    echo "All private Firefox windows have been closed."
else
    echo "No private Firefox windows were found or an error occurred."
fi

hyprctl clients -j | jq -r '.[] | select(.class == "obsidian" and (.title | test("dancer"))) | .address' | xargs -I{} hyprctl dispatch closewindow "address:{}"
if [ $? -eq 0 ]; then
    echo "Obsidian dancer vault closed."
else
    echo "Obsidian dancer vault window was not found."
fi

# esse if n ta funcionando, mas n sei pq. ver dps
if ps aux | grep -i 'cryptomator' > /dev/null; then
    # close the tagstudio window
    pkill tagstudio
    if [ $? -eq 0 ]; then
        echo "Tagstudio closed."
    else
        echo "Tagstudio instance was not found."
    fi

    # there is no way of knowing if the Necrodancer window is open or not
    pkill nemo
    if [ $? -eq 0 ]; then
        echo "Nemo closed."
    else
        echo "Nemo instance not found."
    fi
    
    # kinda harsh, but it works
    pkill cryptomator
    if [ $? -eq 0 ]; then
        echo "Cryptomator closed."
    else
        echo "Cryptomator instance was not found."
    fi
else
    echo "Cryptomator is not running"
fi


