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
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyrefly = {
          displayTypeErrors = "force-on",
          disableLanguageServices = false,
          analysis = {
            diagnosticMode = "workspace",
            importFormat = "absolute",
            inlayHints = {
              callArgumentNames = "on",
              functionReturnTypes = true,
              pytestParameters = false,
              variableTypes = true,
            },
            showHoverGoToLinks = true,
          },
          disabledLanguageServices = {
            definition = false,
            declaration = false,
            typeDefinition = false,
            codeAction = false,
            completion = false,
            documentHighlight = false,
            references = false,
            rename = false,
            signatureHelp = false,
            hover = false,
            inlayHint = false,
            documentSymbol = false,
            semanticTokens = false,
            implementation = false,
          },
        },
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
