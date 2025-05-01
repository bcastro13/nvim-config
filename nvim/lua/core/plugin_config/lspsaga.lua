require("lspsaga").setup({
	finder = {
		max_height = 1.0,
		max_width = 1.0,
		right_width = 0.4,
	},
	code_action = {
		extend_gitsigns = true,
	},
})

vim.diagnostic.config({
	virtual_text = true,
})

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", bufopts)
vim.keymap.set("n", "gD", "<cmd>Lspsaga incoming_calls<CR>", bufopts)
vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", bufopts)
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", bufopts)

vim.keymap.set("n", "<leader>d", "<Cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
vim.keymap.set("n", "<leader>dn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
vim.keymap.set("n", "<leader>dp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)

vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)

local function clean_namespace()
	local params = {
		command = "clean-ns",
		arguments = {
			vim.uri_from_bufnr(0), -- File URI
			0, -- Line number (ignored, but required)
			0, -- Character number (ignored, but required)
		},
	}
	vim.lsp.buf.execute_command(params)
end

--vim.api.nvim_create_autocmd("BufWritePre", {
--	pattern = "*.clj,*.cljs,*.cljc",
--	callback = clean_namespace,
--})
