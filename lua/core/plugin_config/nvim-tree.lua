vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
require("nvim-tree").setup({
    view = {
        relativenumber = true
    },
    renderer = {
        indent_markers = {
            enable = true
        },
        icons = {
            git_placement = "signcolumn",
            show = {
                file = true,
                folder = false,
                git = true,
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    }
})
