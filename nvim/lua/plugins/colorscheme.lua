return {
	'projekt0n/github-nvim-theme',
	config = function()
		require('github-theme').setup({
			options = {
				transparent = true,
			}
		})
		vim.cmd('colorscheme github_dark_default')

		-- 背景透過。colorschemeの後に設定する
		vim.cmd('highlight Normal ctermbg=none guibg=none')
		vim.cmd('highlight NonText ctermbg=none guibg=none')
		vim.cmd('highlight LineNr ctermbg=none guibg=none')
		vim.cmd('highlight Folded ctermbg=none guibg=none')
		vim.cmd('highlight EndOfBuffer ctermbg=none guibg=none')
	end
}
