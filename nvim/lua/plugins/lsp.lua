return {
	{
		'williamboman/mason.nvim', opts ={}
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require'lspconfig'.lua_ls.setup{}
		end

	}
}
