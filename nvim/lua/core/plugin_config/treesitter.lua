require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"bash",
	"c",
	"clojure",
	"css",
	"dockerfile",
	"git_config",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"git_rebase",
	"javascript",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"rust",
	"sql",
	"vim",
	"vimdoc",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"c",
		"clojure",
		"css",
		"dockerfile",
		"gitcommit",
		"javascript",
		"lua",
		"make",
		"markdown",
		"python",
		"rust",
		"sql",
		"yaml",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
