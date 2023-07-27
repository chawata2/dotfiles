-- VSCodeコマンド
vim.keymap.set("n", "<leader>o", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<leader>c", "<Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>")

vim.keymap.set("n", "H", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
vim.keymap.set("n", "L", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")

vim.keymap.set("n", "<leader>b", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
vim.keymap.set("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")
vim.keymap.set("n", "<C-t>", "<Cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>")

vim.keymap.set("n", "<leader>g", "<Cmd>call VSCodeNotify('workbench.view.search')<CR>")

vim.keymap.set("n", "gh", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>")
vim.keymap.set("n", "gd", "<Cmd>call VSCodeNotify('editor.action.goToDeclaration')<CR>")
