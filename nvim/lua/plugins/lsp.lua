return {
	{
		'williamboman/mason.nvim', opts = {}
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require 'lspconfig'.lua_ls.setup {
				settings = {
					diagnotics = {
						globals = { "vim" }
					}
				}
			}
			require 'lspconfig'.clangd.setup {}
		end

	},
	{
		'nvimtools/none-ls.nvim',
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
				null_ls.builtins.formatting.stylua
			})
		end
	},
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		}
	}
}
