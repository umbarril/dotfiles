-----------------------
------ VARIABLES ------
-----------------------

-- See https://wiki.hyprland.org/Configuring/Keywords/

-- Set programs that you use
-- $terminal = kitty  --single-instance --hold zsh -c "fortune | cowsay -f vader"
terminal = 'kitty --hold zsh -c "pokeget-gen1.sh"'

-- nautilus just doesn't work properly on my machine for whatever reason
-- $fileManager = nautilus 
fileManager = 'nemo'
-- $fileManager = spacedrive # not polished yet, maybe look at this in 6 months (half of 2025)

menu = 'rofi -combi-modi window,drun,ssh -show combi -show-icons'
-- $menu = sherlock # it annoyed me that this program was too slow to open, but except for that it's pretty good

powerMenu = 'wlogout.sh'

-- TODO: install rofi-nerdy
emojiMenu = 'rofi -modi emoji -show emoji'

-- not being used
configMenu = 'rofi -show drun -modi drun -drun-categories System,Settings'
gameMenu = 'rofi -show drun -modi drun -drun-categories Game'

-- See https://wiki.hyprland.org/Configuring/Keywords/
mainMod = 'SUPER'  -- Sets "Windows" key as main modifier

--------------------
--- KEYBINDINGSS ---
--------------------

---- record
    hl.bind('SUPER + SHIFT + R', hl.dsp.pass { window = '^(com\\.obsproject\\.Studio)$' })

---- stop recording
    hl.bind('SUPER + SHIFT + D', hl.dsp.pass { window = '^(com\\.obsproject\\.Studio)$' })

---- minimize window
    hl.bind(mainMod .. '+ S', function()
        hl.dispatch(hl.dsp.workspace.toggle_special('magic'))
        hl.dispatch(hl.dsp.window.move({ workspace = '+0' }))
        hl.dispatch(hl.dsp.workspace.toggle_special('magic'))
        hl.dispatch(hl.dsp.window.move({ workspace = 'special:magic' }))
        hl.dispatch(hl.dsp.workspace.toggle_special('magic'))
    end)

    hl.bind('ALT + F4', hl.dsp.window.kill())
    hl.bind('ALT + XF86AudioMicMute', hl.dsp.window.kill()) -- my mic mute key is at the same place as the F4 key
    hl.bind(mainMod .. '+ SHIFT + C', hl.dsp.window.close())
    hl.bind(mainMod .. '+ V', hl.dsp.window.float())

    local function focus_and_close_special()
        local monitors = hl.get_monitors()
        local focused_monitor = nil

        -- Find the monitor that currently has focus
        for _, mon in ipairs(monitors) do
            if mon.focused then
                focused_monitor = mon
                break
            end
        end
        
        if focused_monitor and focused_monitor.active_special_workspace ~= nil then
            local full_name = focused_monitor.active_special_workspace.name
            local special_name = full_name:match(":(.+)$") or full_name
            
            hl.dispatch(hl.dsp.workspace.toggle_special(special_name))
        end
    end

    for i = 1,10 do
        local key = i % 10 -- 10 maps to key 0

        -- Switch workspaces with mainMod + [0-9]
        hl.bind(mainMod .. '+' .. key, hl.dsp.focus { workspace = i })

        hl.bind(mainMod .. '+' .. key, focus_and_close_special)

        -- Move active window to a workspace with mainMod + SHIFT + [0-9]
        hl.bind(mainMod .. '+ SHIFT +' .. key, hl.dsp.window.move { workspace = tostring(i) })

        -- forces to open the workspace on the current monitor -- TODO
        hl.bind(mainMod .. '+ CTRL +' .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
    end

    -- Opens the terminal on special:terminals if it's not running already
    -- If it is running, it will toggle the workspace open
    local function toggle_workspace_or_run(workspace, command)
        return function()
            local windows = hl.get_workspace_windows(workspace)
            local apps_open = #windows > 0

            if not apps_open then
                hl.dispatch(hl.dsp.exec_cmd(command, { workspace = workspace }))
            elseif string.sub(workspace, 1, 8) == "special:" then
                local special_name = string.sub(workspace, 9)
                hl.dispatch(hl.dsp.workspace.toggle_special(special_name))
            else
                hl.dispatch(hl.dsp.focus({ workspace = workspace }))
            end
        end
    end

    hl.bind(mainMod .. '+ A', toggle_workspace_or_run('special:mail', 'thunderbird'))
    hl.bind(mainMod .. '+ SHIFT + A', hl.dsp.window.move { workspace = 'special:mail' })

    hl.bind(mainMod .. '+ Z', toggle_workspace_or_run('special:terminals', terminal))
    hl.bind(mainMod .. '+ SHIFT + Z', hl.dsp.window.move { workspace = 'special:terminals' })

    hl.bind(mainMod .. '+ W', toggle_workspace_or_run('special:obsidian', 'obsidian'))
    hl.bind(mainMod .. '+ SHIFT + W', hl.dsp.window.move { workspace = 'special:obsidian' })

    hl.bind(mainMod .. '+ X', toggle_workspace_or_run('special:obsidian', 'obsidian'))
    hl.bind(mainMod .. '+ SHIFT + X', hl.dsp.window.move { workspace = 'special:obsidian' })

    hl.bind(mainMod .. '+ E', toggle_workspace_or_run('special:filemanager', fileManager))
    hl.bind(mainMod .. '+ SHIFT + E', hl.dsp.window.move { workspace = 'special:filemanager' })

-- Move/resize windows with mainMod + LMB/RMB and dragging
    hl.bind(mainMod .. '+ mouse:272', hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. '+ mouse:273', hl.dsp.window.resize(), { mouse = true })

------ custom ------

---- HOW TO USE AN ANDROID PHONE CAMERA (see arch wiki for more details)
    -- modprobe v4l2loopback exclusive_caps=1
    -- $ ffmpeg -i http://192.168.1.xxx:8080/video -vf format=yuv420p -f v4l2 /dev/video0


    hl.bind(mainMod .. '+ SHIFT + V', hl.dsp.exec_cmd('cliphist list | rofi -dmenu | cliphist decode | wl-copy'))

    hl.bind('XF86PowerOff', hl.dsp.exec_cmd('ape-thime.sh && systemctl suspend-then-hibernate'))

-- Menus
    hl.bind(mainMod ..'+ SPACE', hl.dsp.exec_cmd(menu))
    hl.bind(mainMod .. '+ D', hl.dsp.exec_cmd(powerMenu))
    hl.bind('SUPER + PERIOD', hl.dsp.exec_cmd(emojiMenu))

-- App shortcuts
    hl.bind('CTRL + SUPER + T', hl.dsp.exec_cmd(terminal))
    hl.bind(mainMod .. '+ F', hl.dsp.window.fullscreen { mode = 'maximized', action = 'toggle' })
    hl.bind(mainMod .. '+ SHIFT + F', hl.dsp.window.fullscreen({ mode = 'fullscreen', action = 'toggle' }))
    hl.bind('CTRL + SUPER + B', hl.dsp.exec_cmd('blueman-manager'))
    hl.bind('CTRL + SUPER + A', hl.dsp.exec_cmd('pavucontrol'))
    hl.bind('CTRL + SUPER + F', hl.dsp.exec_cmd('firefox --new-tab --url about:newtab'))
    hl.bind('CTRL + SUPER + D', hl.dsp.exec_cmd('vesktop'))
    hl.bind('CTRL + SUPER + P', hl.dsp.exec_cmd('player play-pause')) -- locked true... or meybe not, cz missclicks happen
    hl.bind('CTRL + SHIFT + ESCAPE', hl.dsp.exec_cmd('[float; size 84%; pin] kitty --title tskmgr -o "confirm_os_window_close=0" -o "tab_bar_style=hidden" btop'))

-- Brightness (todo: add a pull request to swayosd to add a minimun brightness option) -- TODO
    hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('swayosd-client --brightness lower'), { locked = true, repeating = true })
    hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('swayosd-client --brightness raise'), { locked = true, repeating = true })

-- GoCheat (todo: configure gocheat so this keybinding is actually useful)
    -- hl.bind(mainMod .. '+ G', hl.dsp.exec_cmd('echo \'kitty --title gocheat-toggle -o "confirm_os_window_close=0" -o "tab_bar_style=hidden" gocheat\' | toggle-execute.sh'))
    --
    -- [float; size 70%; stayfocused; pin]
    -- windowrule = match:title ^gocheat-toggle$, float on
    -- windowrule = match:title ^gocheat-toggle$, size 70%
    -- windowrule = match:title ^gocheat-toggle$, dim_around on
    -- windowrule = match:title ^gocheat-toggle$, stay_focused on
    -- windowrule = match:title ^gocheat-toggle$, pin on

-- Calculator
    hl.bind('CTRL + SUPER + C', hl.dsp.exec_cmd('[float; size 30%; pin] kitty --title calculator -o "confirm_os_window_close=0" -o "tab_bar_style=hidden" fend'))

-- Audio controls 
    hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('volume down'), { locked = true, repeating = true })
    hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('volume up'), { locked = true, repeating = true })
    hl.bind('CTRL + SUPER + J', hl.dsp.exec_cmd('volume down'), { locked = true, repeating = true })
    hl.bind('CTRL + SUPER + K', hl.dsp.exec_cmd('volume up'), { locked = true, repeating = true })
    hl.bind('CTRL + SUPER + I', hl.dsp.exec_cmd('volume mute-toggle'), { locked = true })
    hl.bind('XF86AudioMute', hl.dsp.exec_cmd('volume mute-toggle'), { locked = true })

-- Microphone
    -- TODO: fix cz swayosd isn't working here
    hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('microphone mute-toggle'), { locked = true })
    hl.bind('CTRL + SUPER + O', hl.dsp.exec_cmd('microphone mute-toggle'), { locked = true })
    hl.bind('KP_Subtract', hl.dsp.exec_cmd('microphone mute-toggle'), { locked = true })

-- Capslock 
    hl.bind('Caps_Lock', function()
        -- needed or else swayosd will run before it can detect that the caps lock switched on/off
        local wait = hl.timer(function()
            hl.dispatch(hl.dsp.exec_cmd('swayosd-client --caps-lock'))
        end, {
            timeout = 100,
            type = "oneshot"
        })

        wait:set_enabled(true)
    end)

-- Suspend shortcuts
    hl.bind(mainMod .. '+ END', hl.dsp.exec_cmd('ape-thime.sh && systemctl suspend'))
    hl.bind(mainMod .. '+ CTRL + END', hl.dsp.exec_cmd('ape-thime.sh && systemctl hibernate'))

-- custom colorpicker script with hyprpicker
    hl.bind('CTRL + SUPER_L + L', hl.dsp.exec_cmd('colorpicker'))

-- Open the Camera
    hl.bind('CTRL + SUPER + V', hl.dsp.exec_cmd('cameractrlsgtk4'))

-- hl.bind(' CTRL SUPER, O, pass, ^(vesktop)$

-- Toggles waybar
    hl.bind(mainMod .. '+ B', hl.dsp.exec_cmd('killall -SIGUSR1 waybar'))

-- Move focus with mainMod + arrow keys
    hl.bind(mainMod .. '+ left', hl.dsp.focus({ direction = 'l' }))
    hl.bind(mainMod .. '+ right', hl.dsp.focus({ direction = 'r' }))
    hl.bind(mainMod .. '+ up', hl.dsp.focus({ direction = 'u' }))
    hl.bind(mainMod .. '+ down', hl.dsp.focus({ direction = 'd' }))

-- Windows-like window switching TODO
    -- hl.bind(' ALT, Tab, cyclenext
    -- hl.bind(' ALT, Tab, bringactivetotop
    -- hl.bind(' SHIFT ALT, Tab, layoutmsg, cycleprev
    -- hl.bind(' SHIFT ALT, Tab, bringactivetotop

-- Alt+tab like window switching 
-- TODO: maybe switch to monocle layout instead of using this
    hl.bind(mainMod .. '+ J', function()
        hl.dispatch(hl.dsp.window.cycle_next({ next = false }))

        -- Use the same keys to move inside a group
        hl.dispatch(hl.dsp.group.prev())
    end)

    hl.bind(mainMod .. '+ K', function()
        hl.dispatch(hl.dsp.window.cycle_next())

        -- Use the same keys to move inside a group
        hl.dispatch(hl.dsp.group.next())
    end)


-- Moves bewteen worksapces with H and L (ignores workspaces without windows)
    hl.bind(mainMod .. '+ H', hl.dsp.focus({ workspace = "e-1" }))
    hl.bind(mainMod .. '+ L', hl.dsp.focus({ workspace = "e+1" }))

-- Resize windows
    hl.bind(mainMod .. '+ SHIFT + L', hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind(mainMod .. '+ SHIFT + H', hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind(mainMod .. '+ SHIFT + K', hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind(mainMod .. '+ SHIFT + J', hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- Screenshots
    hl.bind('Print', hl.dsp.exec_cmd('xscreenshot full'))
    hl.bind('SHIFT + Print', hl.dsp.exec_cmd('xscreenshot select'))
    hl.bind('SUPER + SHIFT + S', hl.dsp.exec_cmd('xscreenshot select'))

-- fn + PrtSc
    hl.bind('XF86Launch2', hl.dsp.exec_cmd('xscreenshot select'))

-- FN emulation with Windows key
    hl.bind('SUPER + LEFT', hl.dsp.exec_cmd('wtype -P home'))
    hl.bind('SUPER + RIGHT', hl.dsp.exec_cmd('wtype -P end'))

-- Special thinkpad FN keys
--fn + f7 TODO: make this do something useful
    -- hl.bind('XF86Display', hl.dsp.exec_cmd('notify-send worked'))

--fn + f8 (already toggles network on and off)
-- hl.bind(' ,XF86WLAN', hl.dsp.exec_cmd('notify-send worked'))

--fn + f9 TODO: make this do something useful
    -- hl.bind('XF86Tools', hl.dsp.exec_cmd('notify-send worked'))

--fn + f10 (alteady toggles bluetooth on and off)  

--fn + f11 TODO: make this do something useful
    -- hl.bind('XF86Keyboard', hl.dsp.exec_cmd('notify-send worked'))

--fn + f12 (doesnt work, apparently)
-- hl.bind(' ,XF86Favorites', hl.dsp.exec_cmd('notify-send worked')

hl.bind('SUPER + F10', hl.dsp.pass { window = "^(com\\.obsproject\\.Studio)$" })

-- https://www.reddit.com/r/hyprland/comments/1k6d8r0/comment/mop2bdv/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- disable keys (useful when playing games) TODO
    -- bind = SUPER SHIFT, P, submap, clean
    -- submap = clean
    -- bind = SUPER SHIFT, P, submap, reset
    -- submap = resetbind = SUPER SHIFT, P, submap, clean
    -- submap = clean
    -- bind = SUPER SHIFT, P, submap, reset
    -- submap = reset

-- TODO: create a keybinnd for toggling swallowing windows
