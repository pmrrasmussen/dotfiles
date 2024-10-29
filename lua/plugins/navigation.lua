return {
  -- Telescope (fuzzy file search)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
      'nvim-lua/plenary.nvim'
    },
    defaults = {
      file_ignore_patterns = {
        "lazy-lock.json"
      }
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set({ "n", "v" }, '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set({ "n", "v" }, '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set({ "n", "v" }, '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
      -- vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
  },
  -- NeoTree (file explorer)
  {
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          filtered_items = {
            never_show = {
              ".DS_Store"
            },
          },
        },
        window = {
          mappings = {
            ["l"] = "open",
            ["/"] = "fuzzy_finder",
            ["h"] = "close_node",
            ["H"] = "toggle_hidden",
            ["<space>"] = "none",
            ["."] = "set_root",
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
      })
      vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
		end,
	},

  -- tmux navigator (integration between nvim and tmux pane navigation)
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
