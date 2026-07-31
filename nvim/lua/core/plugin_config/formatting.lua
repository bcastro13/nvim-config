local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		clojure = { "cljfmt" },
		css = { "biome" },
		javascript = { "biome" },
		json = { "biome" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix", "codespell" },
		sql = { "postgresls", "format" },
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
		postgresls = {
			command = "postgres-language-server",
			args = {
				"format",
				"$FILENAME",
				"--write",
				"--line-width=90",
				"--keyword-case=upper",
				"--constant-case=upper",
				"--type-case=upper",
			},
			stdin = false,
		},
	},
	format_on_save = function(bufnr)
		if vim.bo[bufnr].filetype == "sql" then
			return
		end

		return {
			lsp_fallback = true,
			async = false,
			timeout_ms = 2000,
		}
	end,
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
