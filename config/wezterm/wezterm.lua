-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.scrollback_lines = 10000
config.color_scheme = "tokyonight"

-- 背景透過
-- config.window_background_opacity = 0.85

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

-- keymap
config.keys = require("keymap")

-- local config
function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

if file_exists("~/.config/wezterm/local.lua") then
	require("local").apply_local_config(config)
end

-- and finally, return the configuration to wezterm
return config
