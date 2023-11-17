require("mason-lspconfig").setup()
local lsp_conf = require("lspconfig");

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local bufopts = { noremap = true, silent = true }

vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", bufopts)
vim.keymap.set("n", "gD", "<cmd>Lspsaga incoming_calls<CR>", bufopts)
vim.keymap.set('n', 'gh', '<cmd>Lspsaga hover_doc<CR>', bufopts)

vim.keymap.set('n', '<leader>d', '<Cmd>Lspsaga show_line_diagnostics<CR>', bufopts)
vim.keymap.set('n', '<leader>dn', '<Cmd>Lspsaga diagnostic_jump_next<CR>', bufopts)
vim.keymap.set('n', '<leader>dp', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', bufopts)

vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)

lsp_conf.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
        },
    }
}

lsp_conf.clojure_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lsp_conf.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}


lsp_conf.ruff_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}

lsp_conf.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp_conf.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp_conf.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp_conf.intelephense.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp_conf.sqlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp_conf.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp_conf.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp_conf.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})







--local lsp = require("lsp-zero")
--
--require('mason').setup({})
--require('mason-lspconfig').setup({
--    ensure_installed = { 'tsserver', 'rust_analyzer' },
--    handlers = {
--        lsp.default_setup,
--    }
--})
--
--local cmp = require('cmp')
--local cmp_action = lsp.cmp_action()
--local cmp_select = { behavior = cmp.SelectBehavior.Select }
--cmp.setup({
--    window = {
--        completion = cmp.config.window.bordered(),
--        documentation = cmp.config.window.bordered(),
--    },
--    mapping = cmp.mapping.preset.insert({
--        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
--        ['<Shift-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
--        ['<CR>'] = cmp.mapping.confirm({
--            behavior = cmp.ConfirmBehavior.Replace,
--            select = true,
--        }),
--        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--        ['<C-d>'] = cmp.mapping.scroll_docs(4),
--    })
--})
--
--lsp.set_preferences({
--    suggest_lsp_servers = false,
--    sign_icons = {
--        error = 'E',
--        warn = 'W',
--        hint = 'H',
--        info = 'I'
--    }
--})
--
--lsp.on_attach(function(client, bufnr)
--    local opts = { buffer = bufnr, remap = true }
--
--    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
--    vim.keymap.set("n", "<eader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--end)
--
--lsp.setup()
--
--vim.diagnostic.config({
--    virtual_text = true
--})
