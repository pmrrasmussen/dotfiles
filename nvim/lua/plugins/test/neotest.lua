return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local ntest = require("neotest")
		ntest.setup({
			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					dap = { justMyCode = false },
					-- Extra arguments for pytest
					args = { "--log-level=DEBUG" },
					-- Command to use to run tests
					-- Can be a string or a list of strings
					command = "pytest",
					-- Pattern used to identify test files
					-- Can be a string or a list of strings
					-- Default: "test_*.py" | "*_test.py"
					filename_pattern = "test_*.py",
					-- Function to configure how the adapter is set up
					-- Takes the adapter as an argument, the result of the setup function,
					-- and the extra arguments to neotest-python.setup()
					-- This can be used to modify the adapter before it is returned
					-- e.g. to set up custom signs or mappings
					-- setup_adapter = function(adapter, opts) return adapter end,
				}),
			},
		})
	end,
	keys = {
		{ "<leader>tr", ":Neotest run<cr>", mode = { "n", "v" }, desc = "Neo[t]est [r]un" },
		{ "<leader>to", ":Neotest output-panel<cr>", mode = { "n", "v" }, desc = "Neo[t]est [o]utput" },
		{ "<leader>ts", ":Neotest summary<cr>", mode = { "n", "v" }, desc = "Neo[t]est [o]utput" },
	},
}
