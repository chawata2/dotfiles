local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- タブが一つしかない時はタブバーを非表示
-- config.hide_tab_bar_if_only_one_tab = true

-- タイトルバーを非表示
config.window_decorations = "RESIZE"

config.window_padding = {
	top = 4,
	bottom = 0,
}

-- フォントの設定
config.font = wezterm.font_with_fallback({
	"Moralerspace Xenon",
	"JetBrainsMono Nerd Font",
	"Cica",
})

-- フォントサイズの設定
config.font_size = 12

local c_schema = "Everforest Dark (Gogh)"
local scheme = wezterm.color.get_builtin_schemes()[c_schema]
config.color_scheme = c_schema

config.window_frame = {
	active_titlebar_bg = scheme.background,
	inactive_titlebar_bg = scheme.background,
}

-- 背景透過の設定
-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 5

-- 区切り文字
config.selection_word_boundary = " \t\n{}[]()\"'`~!=:;,.<>/?\\|"

config.leader = {
	key = "t",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

config.keys = {
	-- Cmd+n で新しいタブを開く
	{
		mods = "CMD",
		key = "n",
		action = wezterm.action.SpawnTab("DefaultDomain"),
	},
	-- quick select
	{
		mods = "ALT",
		key = "c",
		action = wezterm.action.QuickSelect,
	},
	{
		mods = "LEADER",
		key = "[",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "ALT",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "ALT",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "ALT",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "ALT",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "ALT",
		key = "z",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("DefaultDomain"),
	},
	{
		mods = "LEADER",
		key = "q",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	-- Move to the next tab
	{
		mods = "ALT",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- Move to the previous tab
	{
		mods = "ALT",
		key = "p",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	-- Move to a specified tab ID
	{
		mods = "LEADER",
		key = "1",
		action = wezterm.action.ActivateTab(0),
	},
	{
		mods = "LEADER",
		key = "2",
		action = wezterm.action.ActivateTab(1),
	},
	{
		mods = "LEADER",
		key = "3",
		action = wezterm.action.ActivateTab(2),
	},
	{
		mods = "LEADER",
		key = "4",
		action = wezterm.action.ActivateTab(3),
	},
	{
		mods = "LEADER",
		key = "5",
		action = wezterm.action.ActivateTab(4),
	},
	-- ¥でバックスラッシュ
	{
		key = "¥",
		action = wezterm.action.SendKey({ key = "\\" }),
	},
	-- ALT + ¥で¥
	{
		key = "¥",
		mods = "ALT",
		action = wezterm.action.SendKey({ key = "¥" }),
	},
	-- タブ並び替え
	{ key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
	-- ワークスペースを作成・切り替え
	{
		key = "p",
		mods = "CMD",
		-- action = wezterm.action.SwitchWorkspaceRelative(-1)
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
	},
	-- ワークスペースのリネーム
	{
		-- Rename workspace
		mods = "LEADER",
		key = "$",
		action = wezterm.action.PromptInputLine({
			description = "(wezterm) Set workspace title:",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
				end
			end),
		}),
	},
	{ key = "n", mods = "CTRL", action = wezterm.action.SwitchWorkspaceRelative(1) },
	{ key = "p", mods = "CTRL", action = wezterm.action.SwitchWorkspaceRelative(-1) },
}

-- ペインをリサイズするモード
table.insert(config.keys, {
	mods = "LEADER",
	key = "r",
	action = wezterm.action.ActivateKeyTable({
		name = "resize_pane",
		one_shot = false,
	}),
})

local act = wezterm.action
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

		-- Cancel the mode
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- ワークスペース名をタブバー右側に表示
wezterm.on("update-status", function(window, pane)
	local workspace = window:active_workspace()
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = scheme.ansi[3] } }, -- green
		{ Background = { Color = scheme.background } },
		{ Attribute = { Italic = true } },
		{ Text = "  " .. workspace .. "  " },
		"ResetAttributes",
	}))
end)

return config
