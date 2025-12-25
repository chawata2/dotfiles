local wezterm = require("wezterm")

-- タブのタイトルをカスタマイズする
local function basename(s)
	return s:gsub("^.+[/\\]", "")
end

wezterm.on("format-tab-title", function(tab)
	local pane = tab.active_pane
	local proc = basename(pane.foreground_process_name or "")
	local title = proc

	if proc == "" or proc == "zsh" or proc == "bash" or proc == "fish" then
		-- シェルのときはカレントディレクトリ名を表示
		local cwd = pane.current_working_dir
		local path = ""
		if cwd then
			-- file://host/path → /path に
			path = (cwd.file_path or tostring(cwd)):gsub("^file://[^/]*", "")
			-- 末尾のディレクトリ名だけ
			path = path:gsub("/+$", "")
			path = path:match("([^/]+)$") or path
		end
		title = path ~= "" and path or proc
	end
	return { { Text = " " .. (title or "") .. " " } }
end)

-- ステータスバーの更新イベント
wezterm.on("update-status", function(window, pane)
	-- 現在のワークスペース名を取得
	local stat = window:active_workspace()

	-- 右側に表示する文字列を設定
	window:set_right_status(wezterm.format({
		{ Foreground = { AnsiColor = "Green" } },
		{ Text = "  " }, -- アイコン（任意）
		{ Foreground = { AnsiColor = "White" } },
		{ Text = "Workspace: " .. stat .. "  " },
	}))
end)

-- 以下設定

local config = wezterm.config_builder()

config.window_padding = {
	top = 0,
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
config.color_scheme = "Everforest Dark (Gogh)"

-- 背景透過の設定
-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 25

-- 区切り文字
config.selection_word_boundary = " \t\n{}[]()\"'`~!=:;,.<>/?\\|"

config.leader = {
	key = "t",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

-- config.use_fancy_tab_bar = false
-- config.window_decorations = "RESIZE"

config.keys = {
	-- quick select
	{
		mods = "ALT",
		key = "f",
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
	-- ワークスペースを作成・切り替え
	{
		mods = "LEADER",
		key = "s",
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

return config
