local telescope = require("telescope")

telescope.setup({
	defaults = {
		hidden = true,
		vimgrep_arguments = {
			"rg",
			"-g=!.git/logs",
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
telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>fc", function()
	builtin.grep_string({ additional_args = { "--hidden" } })
end, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
