return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  init = function()
    -- Reserve a space in the gutter
    -- This will avoid an annoying layout shift in the screen
    vim.opt.signcolumn = "yes"
  end,
  config = function()
    local lsp_defaults = require("lspconfig").util.default_config

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    lsp_defaults.capabilities =
        vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end
        if client.name == "ruff" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = "LSP: Disable hover capability from Ruff",
    })

    -- LspAttach is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
        vim.keymap.set("n", "<leader>j", function()
          local pos = vim.api.nvim_win_get_cursor(0)
          vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR, wrap = true })
          local pos2 = vim.api.nvim_win_get_cursor(0)
          if pos[0] == pos2[0] and pos[1] == pos2[1] then
            vim.diagnostic.goto_next({ wrap = true })
          end
        end, opts)
        vim.keymap.set("n", "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<leader>s", function()
          vim.lsp.buf.format({ async = true })
          vim.api.nvim_command("write")
        end, opts)
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      end,
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "ruff", "jdtls", "basedpyright", "lua_ls", "omnisharp" },
      handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
              },
            },
          })
        end,
        basedpyright = function()
          require("lspconfig").basedpyright.setup({
            settings = {
              basedpyright = {
                disableOrganizeImports = true,
                analysis = {
                  ignore = { "*" },
                  typeCheckingMode = "off",
                },
              },
            },
          })
        end,
      },
    })
  end,
}
