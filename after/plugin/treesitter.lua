require"nvim-treesitter.configs".setup {
    ensure_installed = {
        "vimdoc",
        "lua",
        "javascript",
        "typescript",
        "c",
        "python",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
