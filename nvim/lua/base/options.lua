-- 行番号
vim.opt.number = true

-- タブサイズ
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- マウス操作
vim.opt.mouse = "a"

-- タイトル表示
vim.opt.title = true

-- help言語
vim.opt.helplang = "ja"

-- -エラー時の音を画面表示に
vim.opt.visualbell = true

-- -括弧の連携
vim.opt.showmatch = true
vim.opt.matchtime = 1

-- タブバーを常に表示
vim.opt.showtabline = 2

-- クリップボード連携
vim.opt.clipboard:append({ "unnamedplus" })

-- バッファを保存せずに切り替え可
vim.opt.hidden = true

-- 検索
-- -大文字無視
vim.opt.ignorecase = true
-- -大文字で検索したら区別をつける
vim.opt.smartcase = true
-- -検索が末尾までいったら先頭から検索
vim.opt.wrapscan = true

vim.opt.signcolumn = "yes"

-- ターミナルを開いたらインサートモード
vim.cmd("autocmd TermOpen * :startinsert")

-- ターミナルモードで行番号を非表示
vim.cmd("autocmd TermOpen * setlocal norelativenumber")
vim.cmd("autocmd TermOpen * setlocal nonumber")

vim.api.nvim_create_user_command("Jterm", "term", { nargs = 0 })
vim.api.nvim_create_user_command("Jtermvertical", "vsplit | wincmd l  | term", { nargs = 0 })
vim.api.nvim_create_user_command("Jtermsplit", "split | wincmd j  | term", { nargs = 0 })
vim.api.nvim_create_user_command("Jrepl", "IronRepl", { nargs = 0 })
