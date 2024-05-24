if not vim.g.vscode then
	require("config.options")
	require("config.keymaps")
	require("config.commands")
else
	require("config.vscode-settings")
end

-- local固有の設定
local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local local_config_file = "local.config"
if file_exists(local_config_file) then
	require(local_config_file)
end


-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" }
	}
})

-- Neovimの背景を透過
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

