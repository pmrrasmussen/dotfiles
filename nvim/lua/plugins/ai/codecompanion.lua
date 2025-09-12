return {
	"olimorris/codecompanion.nvim",
	opts = {
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		},
		strategies = {
			chat = {
				slash_commands = {
					["file"] = {
						-- Location to the slash command in CodeCompanion
						callback = "strategies.chat.slash_commands.file",
						description = "Select a file using fzf-lua",
						opts = {
							provider = "fzf_lua", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks"
							contains_code = true,
						},
					},
				},
				adapter = "copilot",
				model = "claude-3.5-sonnet",
			},
			inline = {
				adapter = "copilot",
				model = "claude-3.5-sonnet",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ravitemer/mcphub.nvim",
	},
	keys = {
		{ "<leader>cc", ":CodeCompanionChat Toggle<cr>", desc = "Toggle [C]odeCompanion [C]hat" },
		{ "<leader>ce", ":CodeCompanion /explain<cr>", mode = { "n", "v" }, desc = "[C]odeCompanion [E]xplain" },
		{
			"<leader>cd",
			":CodeCompanion /lsp<cr>",
			mode = { "n", "v" },
			desc = "[C]odeCompanion [D]iagnose using LSP",
		},
		{
			"<leader>cf",
			":CodeCompanion #{buffer} please fix this code<cr>",
			mode = { "n", "v" },
			desc = "[C]odeCompanion [F]ix",
		},
		{
			"<leader>ca",
			":CodeCompanionActions<cr>",
			mode = { "n", "v" },
			desc = "[C]odeCompanion [A]ctions",
		},
	},
}
