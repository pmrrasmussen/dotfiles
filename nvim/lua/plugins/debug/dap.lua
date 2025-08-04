return {
	"mfussenegger/nvim-dap",
	-- TODO: Including codelldb in the lsp mason setup to get this to work. Refactor?
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			mode = "n",
			desc = "[D]ebug toggle [b]reakpoint",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			mode = "n",
			desc = "[D]ebug step [i]nto",
		},
		{
			"<leader>do",
			function()
				require("dap").step_out()
			end,
			mode = "n",
			desc = "[D]ebug step [o]ut",
		},
		{
			"<leader>dn",
			function()
				require("dap").step_into()
			end,
			mode = "n",
			desc = "[D]ebug step over ([n]ext)",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue({ new = true })
			end,
			mode = "n",
			desc = "[D]ebug step over ([n]ext)",
		},
	},
}
