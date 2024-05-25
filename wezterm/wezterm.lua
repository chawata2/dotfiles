-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = 'Atom'

-- 背景透過
config.window_background_opacity = 0.75

config.font_size = 9.5
config.audible_bell = "Disabled"
config.scrollback_lines = 3499

config.default_prog = { "wsl.exe", "--distribution", "ubuntu", "--cd", "~" }
-- タブ横の+を右クリックすると表示されるメニュー
config.launch_menu = {
	{
		args = { "wsl.exe", "--distribution", "ubuntu", "--cd", "~" },
		label = "wsl"
	},
	{
		label = "cmd",
	},
}

local act = wezterm.action
config.keys = {
	{
		key = "t",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "y",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SpawnTab("DefaultDomain"),
	},
	{
		key = "%",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "SHIFT|CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
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


-- local config
local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

if file_exists(os.getenv("HOME") .. "/.config/wezterm/local.lua") then
	require("local").apply_local_config(config)
end

-- and finally, return the configuration to wezterm
return config
