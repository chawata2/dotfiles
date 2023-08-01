require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-telescope/telescope.nvim")
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
	use("folke/which-key.nvim")
	use("lukas-reineke/indent-blankline.nvim")
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
end)

-- Packerオートコンパイル
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "plugins.lua" },
	command = "PackerCompile",
})

vim.cmd("colorscheme kanagawa")
