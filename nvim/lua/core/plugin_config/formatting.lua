local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		clojure = { "cljfmt" },
		css = { "biome" },
		python = { "ruff_format", "ruff_fix", "codespell" },
		javascript = { "biome" },
		json = { "biome" },
	},
	formatters = {
		cljfmt = {
			command = ".local/share/nvim/mason/bin/cljfmt",
			args = {
				"fix",
				"--remove-multiple-non-indenting-spaces",
				"--split-keypairs-over-multiple-lines",
				"--sort-ns-references",
				"-",
			},
		},
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 2000,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
