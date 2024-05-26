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
			require 'lspconfig'.tsserver.setup {
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
			}
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
	}
}
