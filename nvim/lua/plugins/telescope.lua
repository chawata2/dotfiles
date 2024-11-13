return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ '<leader>fg', "<cmd>Telescope live_grep<cr>",  desc = 'Telescope live grep' },
		{ '<leader>fb', "<cmd>telescope buffers<cr>",    desc = 'Telescope buffers' },
		{ '<leader>fh', "<cmd>telescope  help_tags<cr>", desc = 'Telescope help tags' },
	}
}
