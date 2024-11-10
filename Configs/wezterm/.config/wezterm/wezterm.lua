-- https://alexplescan.com/posts/2024/08/10/wezterm/
local wezterm = require 'wezterm'
local appearance = require 'appearance'
-- local projects = require 'projects'
-- local smart_splits = require 'smart_splits'
local act = wezterm.action
local config = wezterm.config_builder()

if appearance.is_dark() then
    config.color_scheme = 'Catppuccin Macchiato'
else
    config.color_scheme = 'Catppuccin Latte'
end

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 14.0

config.window_background_opacity = 0.95
config.macos_window_background_blur = 30
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
config.window_frame = {
    font = wezterm.font({family = 'FiraCode Nerd Font Mono'}),
    font_size = 14
}

local function segments_for_right_status(window)
    return {
        --    window:active_workspace(),
        wezterm.hostname(), wezterm.strftime('%a %b %-d %H:%M')
    }
end

wezterm.on('update-status', function(window, _)
    local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    local segments = segments_for_right_status(window)

    local color_scheme = window:effective_config().resolved_palette
    -- Note the use of wezterm.color.parse here, this returns
    -- a Color object, which comes with functionality for lightening
    -- or darkening the colour (amongst other things).
    local bg = wezterm.color.parse(color_scheme.background)
    local fg = color_scheme.foreground

    -- Each powerline segment is going to be coloured progressively
    -- darker/lighter depending on whether we're on a dark/light colour
    -- scheme. Let's establish the "from" and "to" bounds of our gradient.
    local gradient_to, gradient_from = bg
    if appearance.is_dark() then
        gradient_from = gradient_to:lighten(0.2)
    else
        gradient_from = gradient_to:darken(0.2)
    end

    -- Yes, WezTerm supports creating gradients, because why not?! Although
    -- they'd usually be used for setting high fidelity gradients on your terminal's
    -- background, we'll use them here to give us a sample of the powerline segment
    -- colours we need.
    local gradient = wezterm.color.gradient({
        orientation = 'Horizontal',
        colors = {gradient_from, gradient_to}
    }, #segments -- only gives us as many colours as we have segments.
    )

    -- We'll build up the elements to send to wezterm.format in this table.
    local elements = {}

    for i, seg in ipairs(segments) do
        local is_first = i == 1

        if is_first then
            table.insert(elements, {Background = {Color = 'none'}})
        end
        table.insert(elements, {Foreground = {Color = gradient[i]}})
        table.insert(elements, {Text = SOLID_LEFT_ARROW})

        table.insert(elements, {Foreground = {Color = fg}})
        table.insert(elements, {Background = {Color = gradient[i]}})
        table.insert(elements, {Text = ' ' .. seg .. ' '})
    end

    window:set_right_status(wezterm.format(elements))
end)

config.leader = {key = 'a', mods = 'CTRL', timeout_milliseconds = 1000}
config.keys = {
    {key = 'LeftArrow', mods = 'OPT', action = act.SendString '\x1bb'},
    {key = 'RightArrow', mods = 'OPT', action = act.SendString '\x1bf'}, {
        key = ',',
        mods = 'SUPER',
        action = act.SpawnCommandInNewTab {
            cwd = wezterm.home_dir,
            args = {'nvim', wezterm.config_file}
        }
    }, {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = act.SendKey {key = 'a', mods = 'CTRL'}
    }, {
        key = 'p',
        mods = 'LEADER',
        action = act.ShowLauncherArgs {flags = 'FUZZY|WORKSPACES'}
    }, -- {
    --   key = 'f',
    --   mods = 'LEADER',
    --   action = projects.choose_project(),
    -- },
    {key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState}
}

-- smart_splits.apply_to_config(config)

return config

