require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "clojure",
        "rust",
        "bash",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "gitcommit",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
