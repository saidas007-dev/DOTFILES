local wezterm = require("wezterm")

-- NOTE: I removed the "gui-startup" fullscreen code.
-- Now the window will open normally, and Linux Mint should remember its position better.

return {
	-- Set NuShell as default
	default_prog = { "nu" },

	-- Thin Cursor
	default_cursor_style = "BlinkingBar",

	-- Everforest Theme (Hard Dark)
	colors = {
		background = "#272E33",
		foreground = "#D3C6AA",
		cursor_bg = "#A7C080",
		cursor_border = "#A7C080",
		cursor_fg = "#272E33",
		selection_bg = "#425047",
		selection_fg = "#D3C6AA",
		split = "#425047",

		ansi = {
			"#272E33",
			"#E67E80",
			"#A7C080",
			"#DBBC7F",
			"#7FBBB3",
			"#D699B6",
			"#83C092",
			"#D3C6AA",
		},
		brights = {
			"#4C566A",
			"#E67E80",
			"#A7C080",
			"#DBBC7F",
			"#7FBBB3",
			"#D699B6",
			"#83C092",
			"#FFFFFF",
		},

		tab_bar = {
			inactive_tab = {
				bg_color = "#1E2326",
				fg_color = "#859289",
			},
		},
	},

	-- Window Look
	window_background_opacity = 0.80,
	text_background_opacity = 1.00,
	window_padding = { left = 5, right = 5, top = 5, bottom = 5 },

	-- Font
	font = wezterm.font("DankMono Nerd Font", { weight = "ExtraBold", italic = true }),
	font_size = 22,

	-- Tab Bar
	enable_tab_bar = false,
	-- Initial Window Size
	initial_cols = 115,
	initial_rows = 28,

	-- System Integration
	enable_kitty_keyboard = true,
}
