vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { noremap = true })

vim.keymap.set("n", "<C-h>", ":bprev<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":bnext<CR>", { noremap = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
