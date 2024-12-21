local preview_on = { winopts = { preview = { hidden = "nohidden" } } }
return {
	"ibhagwan/fzf-lua",
	-- -- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", mode = { "n", "v" }, desc = "[F]zf find [f]iles" },
		{ "<leader>fl", "<cmd>FzfLua lines<cr>", mode = { "n", "v" }, desc = "[F]zf open buffer [l]ines" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", mode = { "n", "v" }, desc = "[F]zf live [g]rep" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", mode = { "n", "v" }, desc = "[F]zf [b]uffers" },
		{ "<leader>fw", "<cmd>FzfLua grep_cword<cr>", mode = { "n", "v" }, desc = "[F]zf current [w]ord" },
		{ "<leader>fc", "<cmd>FzfLua lgrep_cbuf<cr>", mode = { "n", "v" }, desc = "[F]zf [c]urrent buffer" },
		{
			"<leader>fr",
			function()
				require("fzf-lua").lsp_references(preview_on)
			end,
			mode = { "n", "v" },
			desc = "[F]zf [r]eferences",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").lsp_document_symbols(preview_on)
			end,
			mode = { "n", "v" },
			desc = "[F]ind [s]ymbols",
		},
	},
	opts = {
		{ "borderless_full" },
		winopts = {
			preview = { hidden = "hidden" },
		},
		defaults = {
			git_icons = false,
			file_icons = false,
		},
		files = {
			cwd_prompt = false,
		},
	},
}
