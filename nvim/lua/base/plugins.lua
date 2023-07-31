require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "kkharji/sqlite.lua" },
	})
	use("nvim-lua/plenary.nvim")
	use("ap/vim-buftabline")
	use("terryma/vim-expand-region")
	use("terryma/vim-multiple-cursors")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use("unblevable/quick-scope")
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			require("hop").setup()
		end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_end_of_line = true,
			})
		end,
	})
	use("Vigemus/iron.nvim")
	use("github/copilot.vim")
	-- lsp関連
	use("neovim/nvim-lspconfig")
	use("nvimdev/lspsaga.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("dcampos/nvim-snippy")
	use("dcampos/cmp-snippy")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("mhartington/formatter.nvim")
	use({ "j-hui/fidget.nvim", tag = "legacy" })
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("machakann/vim-sandwich")
	use("nvim-treesitter/nvim-treesitter")
	use("h-hg/fcitx.nvim")
	use("rebelot/kanagawa.nvim")
	use("lewis6991/gitsigns.nvim")
	use("folke/zen-mode.nvim")
	use("ojroques/nvim-osc52")
	-- ruby
	use("tpope/vim-endwise")
	use({ "dasupradyumna/midnight.nvim" })
end)

-- Packerオートコンパイル
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "plugins.lua" },
	command = "PackerCompile",
})

require("Comment").setup({})
require("nvim-autopairs").setup({})
require("gitsigns").setup()
vim.cmd("colorscheme midnight")
