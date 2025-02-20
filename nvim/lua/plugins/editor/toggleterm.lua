return {
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = { "ToggleTerm" },
		keys = {
			{
				"<leader>tt",
				function()
					require("toggleterm").toggle(1, nil, nil, "float", "run")
				end,
				desc = "Open [t]erminal for [r]un",
			},
			{
				"<leader>tg",
				function()
					require("toggleterm").toggle(2, nil, nil, "float", "git")
				end,
				desc = "Open [t]erminal for [g]it",
			},
		},
		opts = {
			-- size can be a number or function which is passed the current terminal
			open_mapping = [[<c-\>]],
			-- on_open = fun(t: Terminal), -- function to run when the terminal opens
			-- on_close = fun(t: Terminal), -- function to run when the terminal closes
			-- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
			-- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
			-- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			shade_terminals = true,
			-- shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			start_in_insert = true,
			insert_mappings = false, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			direction = "float",
			-- direction = "vertical",
			close_on_exit = true, -- close the terminal window when the process exits
			-- shell = vim.o.shell, -- change the default shell
			-- This field is only relevant if direction is set to 'float'
			-- float_opts = {
			--   -- The border key is *almost* the same as 'nvim_open_win'
			--   -- see :h nvim_open_win for details on borders however
			--   -- the 'curved' border is a custom border type
			--   -- not natively supported but implemented in this plugin.
			--   border = 'single' or 'double' or 'shadow' or 'curved',
			--   width = <value>,
			--   height = <value>,
			--   winblend = 3,
			--   highlights = {
			--     border = "Normal",
			--     background = "Normal",
			--   }
			-- }
		},
	},
}
