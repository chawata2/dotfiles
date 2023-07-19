-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font("PlemolJP Console NF")
config.scrollback_lines = 10000

-- For example, changing the color scheme:
-- config.color_scheme = "Batman"
-- config.color_scheme = "Cobalt2"
config.color_scheme = "Sakura"
-- config.color_scheme = "Spacemacs (base16)"

-- 背景透過
config.window_background_opacity = 0.85

-- 最初からフルスクリーンで起動
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

-- tsl
-- Todo

-- ショートカットキー設定
config.keys = {
	-- Alt(Opt)+Shift+Fでフルスクリーン切り替え
	{
		key = "f",
		mods = "SHIFT|META",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Ctrl+Shift+tで新しいタブを作成
	{
		key = "t",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	-- Ctrl+Shift+%で新しいペインを作成(画面を水平分割)
	{
		key = "%",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Ctrl+Shift+"で新しいペインを作成(画面を垂直分割)
	{
		key = '"',
		mods = "SHIFT|CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- ペインを閉じる
	{
		key = "e",
		mods = "SHIFT|CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "p",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
}

-- and finally, return the configuration to wezterm
return config
