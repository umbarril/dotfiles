
--------------
--- CONFIG ---
--------------

-- Refer to https://wiki.hyprland.org/Configuring/Variables/
hl.config({
    debug = {
        -- disable_logs = false 
    },
    ecosystem = { enforce_permissions = true },
    cursor = { enable_hyprcursor = true },
    group = {
        groupbar = {
            enabled = false,
            stacked = true,
            height = 2,
            scrolling = false, -- default true
            font_size = 6, -- default 8
            gradients = true,
        },
    },

    general = {
        gaps_in = 2,
        gaps_out = 6,
        border_size = 0,

        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = { colors = { 'rgba(33ccffee)', 'rgba(00ff99ee)' }, angle = 45 },
            inactive_border = { colors = { 'rgba(595959aa)' } },
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,

        layout = 'master',
        -- layout = scroller # hyprscroller plugin
    },

    ---- DECORATION
    -- https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
        rounding = 10,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 'rgba(1a1a1aee)',
        },

        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
        focus_on_activate = false, -- breaks gimp color selector and windowrules don't work on it. leave this disabled for now

        middle_click_paste = false,

        -- enable_swallow = true
        -- swallow_regex = (TagStudio|tagstudio)
    },

    animations = {
        enabled = true,
        workspace_wraparound = false,
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
        kb_layout = 'us_intl, br',
        -- kb_options = 'grp:alt_shift_toggle',  -- used to have caps:swapescape, but it didn't work sometimes. using kanata now

        follow_mouse = 1,

        -- apparently, fixes the issue where swaync would take focus every time a notification shows up
        float_switch_override_focus = 2, -- 0 = no override, 1 = override, 2 = override only if the window is floating
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = true,
            middle_button_emulation = false,
            clickfinger_behavior = false,
            tap_and_drag = false,
        }
    },
    
    plugin = {
        dynamic_cursors = {
            --TODO: configure dynamic-cursors to use hyprcursor for better quality
            --also, test other modes

            --enables the plugin
            enabled = true,

            --sets the cursor behaviour, supports these values:
            --tilt    - tilt the cursor based on x-velocity
            --rotate  - rotate the cursor based on movement direction
            --stretch - stretch the cursor shape based on direction and velocity
            --none    - do not change the cursors behaviour
            mode = 'stretch',

            -- shake = {
            --     --enables shake to find
            --     enabled = false,
            --     nearest = false,
            -- },

            --not working for some reason
            hyprcursor = {
                --use nearest-neighbour (pixelated) scaling when magnifing beyond texture size
                --this will also have effect without hyprcursor support being enabled
                --0 / false - never use pixelated scaling
                --1 / true  - use pixelated when no highres image
                --2         - always use pixleated scaling
                nearest = true,

                --enable dedicated hyprcursor support
                enabled = true,

                --resolution in pixels to load the magnified shapes at
                --be warned that loading a very high-resolution image will take a long time and might impact memory consumption
                ---1 means we use [normal cursor size] * [shake:base option]
                resolution = -1,

                --shape to use when clientside cursors are being magnified
                --see the shape-name property of shape rules for possible names
                --specifying clientside will use the actual shape, but will be pixelated
                fallback = 'clientside',
            }
        }
    }
})
