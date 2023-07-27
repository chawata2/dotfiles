require("base.options")
require("base.keymaps")
require("base.plugins")
require("base.masson")
require("base.lsp")
require("base.null-ls")
require("base.formatter")
require("base.cmp")
require("base.snippy")
require("base.treesitter")

if not vim.g.vscode then
	-- osc52
	function copy()
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
require("local.config")
