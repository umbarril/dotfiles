-- debug:disable_logs = false

-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function ()
    hl.exec_cmd('kitty')

    --- essential stuff ---
    hl.exec_cmd('dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP')
    hl.exec_cmd('dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP')
    hl.exec_cmd('dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY')

    hl.exec_cmd('exec swayosd-server')
    -- pywal
    hl.exec_cmd('wal -R')
    -- todo: configure this
    hl.exec_cmd('libinput-gestures-setup start & ')
    hl.exec_cmd('hyprlock')
    hl.exec_cmd('gnome-keyring-daemon --start --components=secrets')
    hl.exec_cmd('xdg-hyprland-fix')
    hl.exec_cmd('power-mode $(power-mode get)')
    hl.exec_cmd('nm-applet')
    hl.exec_cmd('awww-daemon')
    hl.exec_cmd('powertop --auto-tune &')
    hl.exec_cmd('awww img $HOME/.current-wallpaper --transition-step 60 --transition-type grow')
    hl.exec_cmd('hypridle')
    hl.exec_cmd('kdeconnect-indicator')
    hl.exec_cmd('udiskie -s')
    hl.exec_cmd('systemctl --user start hyprpolkitagent')
    hl.exec_cmd('wl-paste --type text --watch cliphist store ')
    hl.exec_cmd('wl-paste --type image --watch cliphist store')
    hl.exec_cmd('hyprpm reload -n')
    hl.exec_cmd('hyprswitch init --size-factor 5.5 --workspaces-per-row 4 --custom-css $XDG_CONFIG_HOME/hypr/hyprswitch.css &')
    hl.exec_cmd('kanshi')
    -- hl.exec_cmd('opensnitchd #doesn't work because it needs to be run as root
    hl.exec_cmd('opensnitch-ui')
    hl.exec_cmd('mpris-proxy')
    -- japanese
    hl.exec_cmd('fcitx5')
    hl.exec_cmd('hyprsunset')

    ------ optional stuff ------
    hl.exec_cmd('thunderbird')
    hl.exec_cmd('sleep 10s && syncthingtray-qt6')
    hl.exec_cmd('transmission-daemon')
    hl.exec_cmd('batsignal -c 10 -w 30 -f 0')

    -- to maintain a constant level of audio
    hl.exec_cmd('com.github.wwmm.easyeffects --hide-window --service-mode')

    -- ver novamente se em MAIO/2026 o waydroid atualizou com as mudanças relacionadas ao DBUS
    -- corrigir o problema do clipboard n funcionar tbm
    -- exec-once = waydroid session start  -- for whatsapp

    ------ kanata stuff ------
    -- kanata
    hl.exec_cmd('kanata --cfg ${HOME}/.config/kanata/builtin.kbd')
    -- TODO: por isso no systemd (já comecei e pus no .config/systemd/user/kanata.service mas n sei se é a melhor maneira)

    -- kanata-2
    hl.exec_cmd('sleep 5s && kanata --cfg ${HOME}/.config/kanata/dell.kbd') -- sleeping a bit so we are sure this keyboard is kanata-2

    ------ waybar stuff ------
    -- restarts the waybar if the config changes TODO: convert to lua
    hl.exec_cmd('~/.config/hypr/scripts/restart_waybar.sh')

    -- TODO: this doesn't work very well.... fix this later (waybar does not autostart with this)
    -- TODO: convert to lua
    hl.exec_cmd('sleep 5m && ~/.config/hypr/scripts/refresh_uptime_waybar.sh')

    -- Auto-reload on monitor changes (waybar glitches out everytime a monitor is added/removed without this)
    -- TODO: convert to lua
    hl.exec_cmd('exec-once = ~/.config/hypr/scripts/monitor-handler.sh')

    -- i don't know where is waybar being started so i just commented this out for now
    -- exec-once = sleep 5s && waybar > /tmp/waybar.log 2>&1 &
end)
