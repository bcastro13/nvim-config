vim.g.mapleader = " "
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

-- Use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Set 2 spaces for JavaScript and CSS files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "css" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
	end,
})

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.spell = true

vim.keymap.set("i", "jj", "<Esc>")

-- Line numbers
vim.wo.relativenumber = true
vim.opt.colorcolumn = { 79 }
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "gitcommit",
	command = "setlocal colorcolumn=72",
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
