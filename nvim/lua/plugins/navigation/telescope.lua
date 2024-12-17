return {
	-- Telescope (fuzzy file search)
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		-- { "<leader>sf", require("telescope.builtin").find_files, mode = { "n", "v" }, desc = "Telescope find files" },
		-- { "<leader>sg", require("telescope.builtin").live_grep, mode = { "n", "v" }, desc = "Telescope live grep" },
		-- { "<leader>sb", require("telescope.builtin").buffers, mode = { "n", "v" }, desc = "Telescope buffers" },
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				"lazy-lock.json",
			},
		},
	},
}
