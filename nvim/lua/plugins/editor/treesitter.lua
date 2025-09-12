-- Treesitter (syntax parser/highlighter)
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "master",
	opt = {
		ensure_installed = {
			"bash",
			"c_sharp",
			"cpp",
			"css",
			"dockerfile",
			"elixir",
			"go",
			"html",
			"json",
			"latex",
			"lua",
			"markdown_inline",
			"markdown",
			"python",
			"rust",
			"scala",
			"vim",
			"yaml",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
}
