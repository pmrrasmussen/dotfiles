return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImportsOnSave = false,
              disableOrganizeImports = false,
              useLibraryCodeForTypes = false,
              openFilesOnly = true,
            },
            python = {
              analysis = {
                typeCheckingMode = "basic", -- change to "strict" if you want stricter checks
                autoSearchPaths = true,
                exclude = {
                  "**/build",
                  "**/dist",
                  "**/__pycache__",
                  "**/.venv",
                  "**/venv",
                  "**/.mypy_cache",
                  "**/.pytest_cache",
                  "**/wandb",
                  "**.egg-info",
                  "**/site-packages",
                },
              },
            },
          },
        },
      },
    },
  },
}
