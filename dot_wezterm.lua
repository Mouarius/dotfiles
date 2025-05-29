local wezterm = require("wezterm")

local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

config.default_prog = { "/opt/homebrew/bin/fish" }
config.font_size = 14
config.bold_brightens_ansi_colors = true
config.front_end = "WebGpu"
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.92

config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.4,
}

config.macos_window_background_blur = 80
-- WEZTERM $TERM information
-- see : https://wezfurlong.org/wezterm/config/lua/config/term.html?h=term
-- set tempfile $(mktemp) \
--         && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo \
--         && tic -x -o ~/.terminfo $tempfile \
--         && rm $tempfile
-- config.term = "wezterm"
config.term = "xterm-256color"

config.window_decorations = "RESIZE"

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "1cell",
	bottom = "1cell",
}

config.native_macos_fullscreen_mode = true

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local bg = "#313244"

config.colors = {
	tab_bar = {
		background = "#1e1e2e",
		new_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#9399b2",
		},
		new_tab_hover = {
			bg_color = "#313244",
			fg_color = "#909090",
			italic = false,
		},
	},
}

wezterm.on("gui-startup", function(cmd)
	local workspace = "greenday"

	local project_dir = wezterm.home_dir .. "/dev/greenday"
	local fish = "/opt/homebrew/bin/fish"
	local fish_exec = fish .. " -c"
	local args = { "/opt/homebrew/bin/fish" }
	if cmd then
		args = cmd.args
	end

	local editor_tab, editor_pane, window = mux.spawn_window({
		workspace = workspace,
		cwd = project_dir,
		name = "nvim",
		args = { fish },
	})
	editor_pane:send_text("sv && nvim\n")

	local shell_tab, back_pane, _ = window:spawn_tab({
		workspace = workspace,
		cwd = project_dir,
		args = {
			fish
		},
	})
	back_pane:send_text("sv && cd mysite\n")


	local front_pane = back_pane:split({
		direction = "Right",
		size = 0.5,
		cwd = project_dir .. "/fronts",
	})
	front_pane:send_text("nvm use\n")

	local front_pane_2 = front_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = project_dir .. "/fronts",
	})
	front_pane_2:send_text("nvm use\n")

	local server_pane = back_pane:split({
		direction = "Top",
		size = 0.5,
		cwd = project_dir,
		args = {
			fish
		},
	})
	server_pane:send_text("sv && hw-run django-dev\n")

	local git_tab, git_pane = window:spawn_tab({
		workspace = workspace,
		cwd = project_dir,
		args = { fish },
	})
	git_pane:send_text('lazygit\n')

	editor_tab:activate()
	--
	-- We want to startup in the coding workspace
	mux.set_active_workspace("greenday")
end)

tabline.setup({

	sections = {
		tab_active = {
			"index",
			{ "process", padding = { left = 0, right = 2 } },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 2 } } },
	},
	options = {
		theme_overrides = {
			normal_mode = {
				b = { bg = bg },
				c = { bg = bg },
			},
			tab = {
				active = { bg = "#45475a" },
				inactive = { bg = bg },
			},
		},
		section_separators = "",
		component_separators = "",
		tab_separators = "",
	},
})
tabline.apply_to_config(config)

-- Leader is the same as my old tmux prefix
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {

	-- activate panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "x",
		action = act.CloseCurrentPane({ confirm = false }),
	},

	-- misc
	{ mods = "LEADER", key = ":", action = act.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },
	{ mods = "LEADER", key = "m", action = act.TogglePaneZoomState },

	-- navigate tabs
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	
	-- modes
	--
	{
		mods = "LEADER",
		key = "y",
		action = act.ActivateCopyMode,
	},
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{
		key = " ",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "activate_pane",
			timeout_milliseconds = 1000,
		}),
	},
	{
		key = "t",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "tab_manipulation",
			timeout_milliseconds = 1000,
		}),
	},
	{
		key = "w",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "workspace_manipulation",
			timeout_milliseconds = 1000,
		}),
	},
}

config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

		{ key = "Escape", action = "PopKeyTable" },
	},

	activate_pane = {
		{ key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
		{ key = "h", action = act.ActivatePaneDirection("Left") },

		{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },

		{ key = "UpArrow", action = act.ActivatePaneDirection("Up") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },

		{ key = "DownArrow", action = act.ActivatePaneDirection("Down") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },
	},

	tab_manipulation = {
		{ key = "c", action = act.SpawnTab("CurrentPaneDomain") },
		{
			key = "x",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{ key = "Escape", action = "PopKeyTable" },
	},
	workspace_manipulation = {
		-- Switch to the default workspace
		{
			key = "0",
			action = act.SwitchToWorkspace({
				name = "default",
			}),
		},
		{
			key = "1",
			action = act.SwitchToWorkspace({
				name = "greenday",
			}),
		},
		-- Create a new workspace with a random name and switch to it
		{ key = "c", action = act.SwitchToWorkspace },
		-- Show the launcher in fuzzy selection mode and have it list all workspaces
		-- and allow activating one.
		{
			key = "l",
			action = act.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
