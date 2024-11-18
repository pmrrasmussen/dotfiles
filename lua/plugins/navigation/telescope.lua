return {
	-- Telescope (fuzzy file search)
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>f", require("telescope.builtin").find_files, mode = { "n", "v" }, desc = "Telescope find files" },
		{ "<leader>g", require("telescope.builtin").live_grep, mode = { "n", "v" }, desc = "Telescope live grep" },
		{ "<leader>b", require("telescope.builtin").buffers, mode = { "n", "v" }, desc = "Telescope buffers" },
		{
			"<leader>r",
			require("telescope.builtin").lsp_references,
			mode = { "n", "v" },
			desc = "Telescope lsp references",
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"lazy-lock.json",
			},
		},
	},
}
