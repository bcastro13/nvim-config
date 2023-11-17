require("barbar").setup(
    {
        icons = {
             diagnostics = {
                [vim.diagnostic.severity.ERROR] = {enabled = true, icons = ''},
                [vim.diagnostic.severity.WARN] = {enabled = true, icons = ''},
                [vim.diagnostic.severity.INFO] = {enabled = false},
                [vim.diagnostic.severity.HINT] = {enabled = false},
            }
        }
    }
)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
vim.keymap.set('n', '<leader>,', vim.cmd.BufferPrevious)
vim.keymap.set('n', '<leader>.', vim.cmd.BufferNext)

-- Re-order to previous/next
vim.keymap.set('n', '<leader><', vim.cmd.BufferMovePrevious)
vim.keymap.set('n', '<leader>>', vim.cmd.BufferMoveNext)

-- Goto buffer in position...
vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>')
vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>')
vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>')
vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>')
vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>')
vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>')
vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>')
vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>')
vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>')
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLast<CR>')

-- Close buffer
vim.keymap.set('n', '<leader>x', vim.cmd.BufferClose)

-- Magic buffer-picking mode
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

