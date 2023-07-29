-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true })

vim.keymap.set("n", "<leader>h", "^", { noremap = true })
vim.keymap.set("n", "<leader>l", "$", { noremap = true })

-- dict
vim.keymap.set("n", "<leader>dc", ":tabnew ~/.config/cspell/cspell.json<CR>")

-- ファイラー
vim.keymap.set("n", "<leader>f", ":Telescope file_browser<CR>", { noremap = true })

-- grep
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { noremap = true })

-- fzf
vim.keymap.set("n", "<leader>o", ":Telescope find_files<CR>", { noremap = true })

-- quickfix
vim.keymap.set("n", "tq", ":Telescope quickfix<CR>", { noremap = true })

-- バッファ
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<C-h>", ":bprev<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":bnext<CR>", { noremap = true })

--zen
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { noremap = true })

-- terminal mode
vim.keymap.set("n", "<C-t>", ":terminal<CR>", { noremap = true })
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-w><C-w>", "<cmd>wincmd w<CR>", { noremap = true })

-- vim-expand-region
vim.keymap.set("n", "J", "<Plug>(expand_region_expand)", { noremap = true })
vim.keymap.set("v", "J", "<Plug>(expand_region_expand)", { noremap = true })
vim.keymap.set("v", "<leader>j", "<Plug>(expand_region_shrink)", { noremap = true })

-- neo-tree
vim.keymap.set("n", "<C-b>", "<cmd>Neotree<CR>", { noremap = true })

vim.keymap.set("n", "H", "<cmd>HopWord<CR>", { noremap = true })
