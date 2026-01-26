return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    init = function()
      -- moving between splits
      vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
      vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
      vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
      vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {},
  },
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.move").setup()
      require("mini.splitjoin").setup()
    end,
  },
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "zsh" },
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").right(80),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          visual_send = "<leader>rv",
          send_file = "<leader>rf",
          send_line = "<leader>rl",
          interrupt = "<leader>ri",
          exit = "<leader>rq",
          clear = "<leader>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })
    end,
    keys = {
      {
        "<leader>rs",
        "<cmd>IronRepl<cr>",
        desc = "(R)EPL (s)tart",
      },
      {
        "<leader>rr",
        "<cmd>IronRestart<cr>",
        desc = "(R)EPL (r)estart",
      },
      {
        "<leader>rf",
        "<cmd>IronFocus<cr>",
        desc = "(R)EPL (f)ocus",
      },
      {
        "<leader>rh",
        "<cmd>IronHide<cr>",
        desc = "(R)EPL (h)ide",
      },
    },
  },
}
