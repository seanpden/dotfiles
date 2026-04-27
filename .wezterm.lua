-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 24
config.cursor_blink_rate = 500
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-mocha"
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font = wezterm.font("JetBrains Mono")
config.font_size = 13
config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
}
config.window_background_opacity = 0.95
config.window_decorations = "NONE | RESIZE"
-- config.default_domain = "WSL:Ubuntu"
config.initial_cols = 80
config.force_reverse_video_cursor = true

-- and finally, return the configuration to wezterm
config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

return config
