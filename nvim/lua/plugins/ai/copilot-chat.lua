return {}
-- 	"CopilotC-Nvim/CopilotChat.nvim",
-- 	branch = "main",
-- 	cmd = "CopilotChat",
-- 	opts = function()
-- 		local user = vim.env.USER or "User"
-- 		user = user:sub(1, 1):upper() .. user:sub(2)
-- 		return {
-- 			auto_insert_mode = true,
-- 			question_header = "  " .. user .. " ",
-- 			answer_header = "  Copilot ",
-- 			window = {
-- 				width = 0.4,
-- 			},
-- 		}
-- 	end,
-- 	keys = {
-- 		{ "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
-- 		{ "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
-- 		{
-- 			"<leader>aa",
-- 			function()
-- 				return require("CopilotChat").toggle()
-- 			end,
-- 			desc = "Toggle (CopilotChat)",
-- 			mode = { "n", "v" },
-- 		},
-- 		{
-- 			"<leader>ax",
-- 			function()
-- 				return require("CopilotChat").reset()
-- 			end,
-- 			desc = "Clear (CopilotChat)",
-- 			mode = { "n", "v" },
-- 		},
-- 		{
-- 			"<leader>aq",
-- 			function()
-- 				local input = vim.fn.input("Quick Chat: ")
-- 				if input ~= "" then
-- 					require("CopilotChat").ask(input)
-- 				end
-- 			end,
-- 			desc = "Quick Chat (CopilotChat)",
-- 			mode = { "n", "v" },
-- 		},
-- 		-- Show prompts actions with telescope
-- 		-- { "<leader>ap", M.pick("prompt"), desc = "Prompt Actions (CopilotChat)", mode = { "n", "v" } },
-- 	},
-- 	config = {
-- 		mappings = {
-- 			reset = {
-- 				normal = "",
-- 				insert = "",
-- 			},
-- 		},
-- 	},
-- }
