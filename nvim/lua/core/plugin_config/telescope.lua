local telescope = require("telescope")

telescope.setup({
	defaults = {
		hidden = true,
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				preview_width = function(_, cols, _)
					return math.max(math.floor(cols * 0.5), 90)
				end,
			},
		},
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

vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
		vim.wo.number = true
		vim.wo.relativenumber = false
	end,
})

vim.api.nvim_set_hl(0, "TelescopeSelection", {
	bg = "#3b4252",
	fg = "#ffffff",
	bold = true,
})

telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.git_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>fc", function()
	builtin.grep_string({ additional_args = { "--hidden" } })
end, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
