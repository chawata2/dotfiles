local cmp = require("cmp")
local cmp_sources = {
	{ name = "nvim_lsp" },
	{ name = "buffer" },
	{ name = "path" },
	{ name = "cmdline" },
	{ name = "snippy" },
}
local cmp_mappings = {
	["<C-p>"] = cmp.mapping.select_prev_item(),
	["<C-n>"] = cmp.mapping.select_next_item(),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.abort(),
	["<CR>"] = cmp.mapping.confirm({ select = false }),
}
local cmp_snippet = {
	expand = function(args)
		require("snippy").expand_snippet(args.body) -- For `snippy` users.
	end,
}
cmp.setup({
	sources = cmp_sources,
	mapping = cmp_mappings,
	snippet = cmp_snippet,
})

local cmp_cmdline_sources = {
	{ name = "path" },
	{ name = "cmdline" },
}
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp_cmdline_sources,
})
