
-------------
--- RULES ---
-------------
-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
-- USE: hyprctl clients

hl.monitor({
    output = 'eDP-1', mode = '1366x768@60.06', position = '0x0', scale = '1',
    -- output = 'eDP-1', disabled = true -- doesn't work 
})
hl.monitor({
    output = 'HDMI-A-2', mode = '1920x1080@120', position = '-1920x0', scale = '1'
    -- output = 'HDMI-A-2', mode = '1920x1080@120', position = '0x0', scale = '1'
    -- output = 'HDMI-A-2', mode = '1366x768@60', position = '-1366x0', scale = '1'
    -- output = 'HDMI-A-2', mode = '1920x1080@60', position = '-1920x0', scale = '1'
    -- output = 'HDMI-A-2', disabled = true
})

hl.layer_rule({ match = { namespace = 'rofi' }, blur = true })
-- wlogout
hl.layer_rule({ match = { namespace = 'logout_dialog' }, blur = true })
hl.layer_rule({ match = { namespace = 'gtk-layer-shell' }, blur = true })

hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, size = {"(monitor_w*0.7)", "(monitor_h*0.7)"} })

-- You'll probably like this.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- https://wiki.hyprland.org/Useful-Utilities/Screen-Sharing/#xwayland
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, opacity = "0.0 override" })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, no_anim = true })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, no_initial_focus = true })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, max_size = "1 1" })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, no_blur = true })

-- fix chrome contexmenu blur
hl.window_rule({ match = { class = "^()$", title = "^()$" }, no_blur = true })

-- workspaces
hl.window_rule({ match = { class = "^(firefox)$" }, workspace = "1" })
hl.window_rule({ match = { class = "^(jetbrains-studio)$" }, workspace = "2" })
hl.window_rule({ match = { class = "^(vesktop)$" }, workspace = "3" })
hl.window_rule({ match = { class = "^(fooyin)$" }, workspace = "4" })
hl.window_rule({ match = { class = "^(thunderbird)$" }, workspace = "special:mail" })
hl.window_rule({ match = { class = "^(obsidian)$" }, workspace = "special:obsidian" })

-- smart gaps (https://wiki.hyprland.org/Configuring/Workspace-Rules/#smart-gaps)
-- gaps will be disabled on workspaces with a single window
-- alse, when on fullscreen, disable gaps 
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

-- when on fullscreen and with more than one window, show borders 
-- (so many times I've lost a window when using fullscreen, never anymore!!)
hl.workspace_rule({ workspace = "f[1]w[2-999]", border_size = 1 })

-- https://www.reddit.com/r/hyprland/comments/1d0f2ou/to_the_one_person_using_kde_connect_presentation/
-- KDE CONNECT Presentation Mode ( doesn't work :[ )
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, opacity = 1 })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, no_blur = true })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, border_size = 0 })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, no_shadow = true })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, no_anim = true })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, no_focus = true })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, suppress_event = "fullscreen" })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, float = true })
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, pin = true })
-- windowrule = minsize $your $resolution, title:^KDE Connect Daemon$
hl.window_rule({ match = { title = "^KDE Connect Daemon$" }, move = {0, 0} })

hl.window_rule({ match = { class = "^jetbrains-.+$", float = true }, tag = "+jb" })
hl.window_rule({ match = { tag = "jb" }, stay_focused = true })
hl.window_rule({ match = { tag = "jb" }, no_initial_focus = true })

-- DOESNT WORK? WHYYYYY
-- workspace = 2, layoutopt:orientation:top # aparently changes in orientation only work after a restart (reloads don't work)
-- workspace = 2, orientationtop # aparently changes in orientation only work after a restart (reloads don't work)

hl.window_rule({ match = { class = "^(steam)$" }, workspace = "current" })

-- for some reason the gimp color selector warps my mouse everytime this is not suppressed
-- windowrule = suppressevent activatefocus, class:gimp

-- privacy
hl.window_rule({ match = { class = "^(hyprpolkitagent)$" }, no_screen_share = true })
hl.window_rule({ match = { class = "^(org.keepassxc.KeePassXC)$" }, no_screen_share = true })
hl.window_rule({ match = { class = "^(org.cryptomator.launcher.Cryptomator\\$MainApp)$" }, no_screen_share = true })
hl.window_rule({ match = { title = "^.*(Private Browsing)$" }, no_screen_share = true })

hl.window_rule({ match = { class = "^(tagstudio)$" }, no_screen_share = true })
hl.window_rule({ match = { title = "^.*(dancer).*$" }, no_screen_share = true })
