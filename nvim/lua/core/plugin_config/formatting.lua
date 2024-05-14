local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		clojure = { "cljfmt" },
		python = { "ruff_format", "ruff_fix", "codespell" },
	},
	formatters = {
		cljfmt = {
			command = "/usr/local/bin/cljfmt",
			args = {
				"fix",
				"-",
			},
		},
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
