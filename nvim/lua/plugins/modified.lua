return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.files = opts.picker.sources.files or {}
      opts.picker.sources.files.follow = true

      local explorer = opts.picker.sources.explorer or {}
      explorer.win = explorer.win or {}
      explorer.win.list = explorer.win.list or {}
      explorer.win.list.keys = explorer.win.list.keys or {}
      explorer.win.list.keys["<C-l>"] = {
        function()
          -- move focus to the window right of the explorer without closing it
          vim.cmd("wincmd l")
        end,
        mode = { "n", "i" },
        desc = "Focus window right of explorer",
      }
      opts.picker.sources.explorer = explorer
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyrefly = {},
      },
      diagnostics = { virtual_text = false },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "pyrefly") then
        table.insert(opts.ensure_installed, "pyrefly")
      end
    end,
  },
}
