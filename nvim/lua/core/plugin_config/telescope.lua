require("telescope").setup({
	defaults = {
		hidden = true,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
})
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>fg", function()
	builtin.live_grep({ additional_args = { "--hidden" } })
end, {})
vim.keymap.set("n", "<leader>fc", function()
	builtin.grep_string({ additional_args = { "--hidden" } })
end, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
