vim.g.mapleader = " "

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.helplang = "ja"
vim.opt.number = true
vim.opt.backup = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.visualbell = true
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.showtabline = 2                     -- タブバーを常に表示
vim.opt.clipboard:append({ "unnamedplus" }) -- クリップボード連携
vim.opt.hidden = true                       -- バッファを保存せずに切り替え可
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.termguicolors = true
vim.opt.winblend = 20 -- ウィンドウの不透明度
vim.opt.pumblend = 20 -- ポップアップメニューの不透明度

-- 検索
vim.opt.ignorecase = true -- 大文字無視
vim.opt.smartcase = true  -- 大文字で検索したら区別をつける
vim.opt.wrapscan = true   -- 検索が末尾までいったら先頭から検索

vim.opt.signcolumn = "yes"

vim.cmd("autocmd TermOpen * :startinsert") -- ターミナルを開いたらインサートモード
vim.cmd("autocmd TermOpen * setlocal norelativenumber")
vim.cmd("autocmd TermOpen * setlocal nonumber")

-- 背景透過
vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	callback = function()
		vim.cmd('highlight Normal ctermbg=none guibg=none')
		vim.cmd('highlight NonText ctermbg=none guibg=none')
		vim.cmd('highlight LineNr ctermbg=none guibg=none')
		vim.cmd('highlight Folded ctermbg=none guibg=none')
		vim.cmd('highlight EndOfBuffer ctermbg=none guibg=none')
	end
})

vim.cmd('colorscheme default')


vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		vim.lsp.buf.format {
			async = false,
		}
	end,
})
