local lint = require("lint")

lint.linters_by_ft = {
	clojure = { "codespell" },
	python = { "custom_ruff", "codespell" },
}

lint.linters.codespell.args = {
	"-L",
	"edn,juxt,ot",
	"-",
}

local function get_file_name()
	return vim.api.nvim_buf_get_name(0)
end

lint.linters.custom_ruff = {
	cmd = "ruff",
	stdin = true,
	args = {
		"--force-exclude",
		"--quiet",
		"--stdin-filename",
		get_file_name,
		"--no-fix",
		"--output-format",
		"json",
		"-",
	},
	ignore_exitcode = true,
	stream = "stdout",
	parser = function(output)
		local diagnostics = {}
		local ok, results = pcall(vim.json.decode, output)
		if not ok then
			return diagnostics
		end
		for _, result in ipairs(results or {}) do
			local diagnostic = {
				message = result.message,
				col = result.location.column - 1,
				end_col = result.end_location.column - 1,
				lnum = result.location.row - 1,
				end_lnum = result.end_location.row - 1,
				code = result.code,
				severity = vim.diagnostic.severity.ERROR,
				source = "ruff",
			}
			table.insert(diagnostics, diagnostic)
		end
		return diagnostics
	end,
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>ll", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
