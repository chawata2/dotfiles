return {
	'nvim-tree/nvim-tree.lua',
	requires = {
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		require("nvim-tree").setup()
	end,
	keys = {
		{ "<leader>b", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
	}
}
