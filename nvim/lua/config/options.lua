local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.helplang = "ja"
opt.backup = false
opt.mouse = "a"
opt.title = true
opt.visualbell = true
opt.clipboard:append({ "unnamedplus" }) -- クリップボード連携
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.showtabline = 2 -- タブバーを常に表示
opt.hidden = true   -- バッファを保存せずに切り替え可

-- Line Number
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- tab -> space
opt.autoindent = true

-- Search
opt.ignorecase = true -- 大文字無視
opt.smartcase = true  -- 大文字で検索したら区別をつける
opt.wrapscan = true   -- 検索が末尾までいったら先頭から検索
opt.showmatch = true
opt.matchtime = 1

-- UI
opt.winblend = 20 -- ウィンドウの不透明度
opt.pumblend = 20 -- ポップアップメニューの不透明度
opt.signcolumn = 'yes'

opt.termguicolors = true

-- Fold
opt.foldcolumn = '1'
opt.foldmethod = 'expr'
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format {
      async = false,
    }
  end,
})

-- 自動フォーマットを無視して保存
vim.api.nvim_create_user_command('W', 'noautocmd w', {})
