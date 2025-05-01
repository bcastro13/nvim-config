require("mason-lspconfig").setup()
local lsp_conf = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

lsp_conf.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lsp_conf.clojure_lsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		clojure_lsp = {
			sourcePaths = { "src", "test" },
		},
	},
})

lsp_conf.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--lsp_conf.ruff_lsp.setup {
--    on_attach = on_attach,
--    capabilities = capabilities,
--    init_options = {
--        settings = {
--            -- Any extra CLI arguments for `ruff` go here.
--            args = {},
--        }
--    }
--}

lsp_conf.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.dockerls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.biome.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp_conf.docker_compose_language_service.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
