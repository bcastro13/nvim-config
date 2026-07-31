local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, bufopts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", bufopts)
end

vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git", "lua" },
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = {
					vim.fn.stdpath("config") .. "/lua",
					vim.fn.expand("$VIMRUNTIME/lua"),
				},
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.clojure_lsp = {
	cmd = { "clojure-lsp" },
	filetypes = { "clojure", "edn" },
	root_markers = { "project.clj", "deps.edn", ".git" },
	settings = {
		clojure_lsp = {
			sourcePaths = { "src", "test" },
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.ruff = {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.bashls = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.dockerls = {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "dockerfile" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.biome = {
	cmd = { "biome", "lsp-proxy" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
	root_markers = { "biome.json" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.cssls = {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { ".git", "package.json" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = { "package.json", "tsconfig.json", ".git" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.yamlls = {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yml" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.docker_compose_language_service = {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml", "yml" },
	root_markers = { "docker-compose.yml", "docker-compose.yaml" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.gopls = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.config.postgresls = {
	cmd = { "postgres-language-server", "lsp-proxy" },
	filetypes = { "sql" },
	on_attach = on_attach,
	capabilities = capabilities,
}

vim.lsp.enable({
	"lua_ls",
	"clojure_lsp",
	"ruff",
	"bashls",
	"gopls",
	"dockerls",
	"biome",
	"cssls",
	"ts_ls",
	"yamlls",
	"intelephense",
	"docker_compose_language_service",
	"postgresls",
})
