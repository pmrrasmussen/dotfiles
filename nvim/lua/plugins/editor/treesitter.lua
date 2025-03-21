-- Treesitter (syntax parser/highlighter)
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c_sharp",
				"lua",
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
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
