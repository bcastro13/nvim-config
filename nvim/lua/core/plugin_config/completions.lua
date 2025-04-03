local cmp = require("cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
		["<Shift-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
		},
	}, {
		{
			name = "buffer",
		},
	}),
	experimental = {
		ghost_text = true, -- Enables inline preview of completion
	},
})
