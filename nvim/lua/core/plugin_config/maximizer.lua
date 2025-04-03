require("maximizer").setup({})

vim.api.nvim_set_keymap("n", "<C-w>m", '<cmd>lua require("maximizer").toggle()<CR>', { silent = true, noremap = true })
