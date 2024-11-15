vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = "a"
vim.opt.title = true
vim.opt.helplang = "ja"
vim.opt.visualbell = true

-- -括弧の連携
vim.opt.showmatch = true
vim.opt.matchtime = 1

-- クリップボード連携
vim.opt.clipboard:append({ "unnamedplus" })

-- バッファを保存せずに切り替え可
vim.opt.hidden = true

-- 検索オプション
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

vim.opt.signcolumn = "yes"
