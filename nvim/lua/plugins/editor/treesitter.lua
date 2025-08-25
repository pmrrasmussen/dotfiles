-- Treesitter (syntax parser/highlighter)
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "master",
    ensure_installed = {
        "c_sharp",
        "lua",
        "cpp",
        "vim",
        "python",
        "html",
        "css",
        "go",
        "rust",
        "latex",
        "scala",
        "yaml",
        "bash",
        "dockerfile",
        "json",
        "elixir",
    },
    auto_install = true,
    highlight = {
        enable = true,
    }
}
