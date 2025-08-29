vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        vim.treesitter.start()
    end,
})

require("lspconfig").pyright.setup({
    settings = {
        pyright = {
            disableOrganizeImportsOnSave = false,
            disableOrganizeImports = false,
        },
        python = {
            analysis = {
                typeCheckingMode = "off", -- Set to "strict" for stricter type checking
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})

return {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {},
    branch = "regexp",
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
        -- Keymap to open VenvSelector to pick a venv.
        { "<leader>vs", "<cmd>VenvSelect<cr>" },
        -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
        { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
}
