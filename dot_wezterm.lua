local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 13.0
config.color_scheme = "Catppuccin Mocha"
-- WEZTERM $TERM information
-- see : https://wezfurlong.org/wezterm/config/lua/config/term.html?h=term
-- set tempfile $(mktemp) \
--         && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
--         && tic -x -o ~/.terminfo $tempfile \
--         && rm $tempfile
config.term = "wezterm"

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

return config
