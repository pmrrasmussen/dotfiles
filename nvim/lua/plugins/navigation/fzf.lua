return {
	"ibhagwan/fzf-lua",
	-- -- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", mode = { "n", "v" }, desc = "[F]zf find [f]iles" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", mode = { "n", "v" }, desc = "[F]zf live [g]rep" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", mode = { "n", "v" }, desc = "[F]zf [b]uffers" },
	},
}
