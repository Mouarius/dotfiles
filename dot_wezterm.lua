local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "/opt/homebrew/bin/fish" }
config.font_size = 13.0
config.bold_brightens_ansi_colors = true
config.front_end = "WebGpu"
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 1
config.text_background_opacity = 1
-- config.macos_window_background_blur = 10
-- WEZTERM $TERM information
-- see : https://wezfurlong.org/wezterm/config/lua/config/term.html?h=term
-- set tempfile $(mktemp) \
--         && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
--         && tic -x -o ~/.terminfo $tempfile \
--         && rm $tempfile
config.term = "wezterm"

config.window_decorations = "RESIZE"

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.native_macos_fullscreen_mode = true

-- KEYBINDINGS
config.keys = {
}

return config
