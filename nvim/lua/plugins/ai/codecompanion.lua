return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		picker = {
			fzf = {
				fzf_colors = true,
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
				live_grep = {
					winopts = {
						preview = { hidden = "nohidden" },
					},
				},
				grep = {
					winopts = {
						preview = { hidden = "nohidden" },
					},
				},
				lsp = {
					winopts = {
						preview = { hidden = "nohidden" },
					},
				},
			},
			noice = {
				-- add any options here
			},
			mini = {
				-- add any options here
			},
		},
	},
}
