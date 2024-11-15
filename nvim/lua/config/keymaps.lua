vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true })

-- vim.keymap.set("n", "<leader>h", "^", { noremap = true })
-- vim.keymap.set("n", "<leader>l", "$", { noremap = true })
