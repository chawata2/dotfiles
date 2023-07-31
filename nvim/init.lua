require("base.options")
require("base.keymaps")
require("base.plugins")
require("base.treesitter")

if not vim.g.vscode then
	-- osc52
	local function copy()
		if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
			require("osc52").copy_register("+")
		end
	end
	vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
else
	require("base.vscode-settings")
end

--
-- local固有の設定ファイルを読み込む
--
local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local local_config_file = "local.config"
if file_exists(local_config_file) then
	require(local_config_file)
end
