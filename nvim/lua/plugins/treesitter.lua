return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require('nvim-treesitter.configs').setup({
			auto_install = false,
			ensure_installed = { "vim", "dockerfile", "fish", "typescript", "tsx", "javascript", "json", "lua", "gitignore", "bash", "astro", "markdown", "css", "scss", "yaml", "toml", "vue", "php", "html", "cpp" },
			higlight = { enable = true }
		})
	end,
}
