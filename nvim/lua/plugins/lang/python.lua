-- vim.lsp.config("pyrefly", {})
-- vim.lsp.enable("pyrefly")
local config = vim.lsp.config("pyright", {
	settings = {
		pyright = {
			disableOrganizeImportsOnSave = false,
			disableOrganizeImports = false,
			useLibraryCodeForTypes = false,
			openFilesOnly = true,
		},
		python = {
			analysis = {
				typeCheckingMode = "basic", -- change to "strict" if you want stricter checks
				autoSearchPaths = true,
				exclude = {
					"**/build",
					"**/dist",
					"**/__pycache__",
					"**/.venv",
					"**/venv",
					"**/.mypy_cache",
					"**/.pytest_cache",
					"**/wandb",
					"**.egg-info",
					"**/site-packages",
				},
			},
		},
	},
})

return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	opts = {},
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}
