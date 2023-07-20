local wezterm = require("wezterm")

local keymap = {
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

return keymap
