return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	version = false, -- last release is way too old and doesn't work on Windows
	build = function()
		local TS = require("nvim-treesitter")
		TS.update(nil, { summary = true })
	end,
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	opts_extend = { "ensure_installed" },
	opts = {
		indent = { enable = true },
		highlight = { enable = true },
		folds = { enable = true },
		auto_install = true,
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
	},
	-- config = function(_, opts)
	-- 	require("nvim-treesitter.configs").setup(opts)
	-- end,
}
