-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config,
        {
                position = "bottom",
                max_width = 32,
                padding = {
                        left = 1,
                        right = 1,
                        tabs = {
                                left = 0,
                                right = 2,
                        },
                },
                separator = {
                        space = 1,
                        left_icon = wezterm.nerdfonts.fa_long_arrow_right,
                        right_icon = wezterm.nerdfonts.fa_long_arrow_left,
                        field_icon = wezterm.nerdfonts.indent_line,
                },
                modules = {
                        tabs = {
                                active_tab_fg = 4,
                                active_tab_bg = "transparent",
                                inactive_tab_fg = 6,
                                inactive_tab_bg = "transparent",
                                new_tab_fg = 2,
                                new_tab_bg = "transparent",
                        },
                        workspace = {
                                enabled = false,
                                icon = wezterm.nerdfonts.cod_window,
                                color = 8,
                        },
                        leader = {
                                enabled = false,
                                icon = wezterm.nerdfonts.oct_rocket,
                                color = 2,
                        },
                        zoom = {
                                enabled = false,
                                icon = wezterm.nerdfonts.md_fullscreen,
                                color = 4,
                        },
                        pane = {
                                enabled = false,
                                icon = wezterm.nerdfonts.cod_multiple_windows,
                                color = 7,
                        },
                        username = {
                                enabled = false,
                                icon = wezterm.nerdfonts.fa_user,
                                color = 6,
                        },
                        hostname = {
                                enabled = false,
                                icon = wezterm.nerdfonts.cod_server,
                                color = 8,
                        },
                        clock = {
                                enabled = false,
                                icon = wezterm.nerdfonts.md_calendar_clock,
                                format = "%H:%M",
                                color = 5,
                        },
                        cwd = {
                                enabled = false,
                                icon = wezterm.nerdfonts.oct_file_directory,
                                color = 7,
                        },
                        ssh = {
                                enabled = true,
                                icon = wezterm.nerdfonts.md_ssh,
                                color = 5,
                        },
                        --[[ spotify = {
        enabled = false,
        icon = wez.nerdfonts.fa_spotify,
        color = 3,
        max_width = 64,
        throttle = 15,
        }, --]]
                },
        })

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config = {
        initial_cols = 128,
        initial_rows = 32,

        window_padding = { left = 4, right = 0, top = 0, bottom = 0 },

        enable_tab_bar = true,
        use_fancy_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        tab_bar_at_bottom = true,

        -- or, changing the font size and color scheme.
        font_size = 14,
        font = wezterm.font (
                'JetBrainsMonoNL Nerd Font Mono',
                {
                        weight="Regular",
                        stretch="Normal",
                        style="Normal"
                }
        ),
        color_scheme = 'rose-pine-moon',
        color_scheme_dirs = {'./colors/'},

        keys = {
                {
                        key = "F11",
                        mods = "CTRL|SHIFT",
                        action = wezterm.action.ToggleFullScreen,
                },
        },
        mouse_bindings = {
                -- Ctrl-click will open the link under the mouse cursor
                {
                        event = { Up = { streak = 1, button = "Left" } },
                        mods = "CTRL",
                        action = wezterm.action.OpenLinkAtMouseCursor,
                },
        },
}
-- Finally, return the configuration to wezterm:
return config
