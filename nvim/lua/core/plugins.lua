local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-live-grep-args.nvim",
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"olimorris/onedarkpro.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"mbbill/undotree",
	"christoomey/vim-tmux-navigator",
	"lewis6991/gitsigns.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"williamboman/mason.nvim",
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					enable = true,
					sign = true,
					code_action = "💡",
					virtual_text = true,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"0x00-ketsu/maximizer.nvim",
		lazy = true,
	},
}

require("lazy").setup(plugins, {})
