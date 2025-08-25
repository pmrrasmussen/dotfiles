vim.diagnostic.config({ virtual_text = true })
return {
    { "mason-org/mason.nvim", opts = {} },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "jsonls",
                "clangd",
                "pyright",
                "ruff",
                "yamlls",
            },
            automatic_installation = true,
        },
    },
}
