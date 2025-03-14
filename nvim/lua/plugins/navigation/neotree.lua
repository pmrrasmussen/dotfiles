return {
	-- NeoTree (file explorer)
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	priority = 100,
	opts = {
		filesystem = {
			group_empty_dirs = true,
			scan_mode = "deep",
			follow_current_file = {
				enabled = true, -- This will find and focus the file in the active buffer every time
				--               -- the current file is changed while the tree is open.
				leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			filtered_items = {
				never_show = {
					".DS_Store",
				},
			},
		},
		window = {
			mappings = {
				["l"] = "open",
				["/"] = "noop",
				["h"] = "close_node",
				["H"] = "toggle_hidden",
				["<space>"] = "none",
				["."] = "set_root",
				["c"] = "copy",
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c")
					end,
					desc = "Copy Path to Clipboard",
				},
				["O"] = {
					function(state)
						require("lazy.util").open(state.tree:get_node().path, { system = true })
					end,
					desc = "Open with System Application",
				},
				["P"] = { "toggle_preview", config = { use_float = false } },
			},
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", mode = { "n", "v" }, desc = "Toggle file explorer" },
	},
}
