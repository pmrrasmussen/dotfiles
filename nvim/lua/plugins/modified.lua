return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       pyright = {
  --         settings = {
  --           python = {
  --             analysis = {
  --               autoSearchPaths = true,
  --               diagnosticMode = "openFilesOnly",
  --               useLibraryCodeForTypes = false,
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>e",
        (function()
          local previous_buffer = nil
          local previous_window = nil

          return function()
            local explorer_pickers = Snacks.picker.get({ source = "explorer" })
            if #explorer_pickers == 0 then
              previous_buffer = vim.api.nvim_get_current_buf()
              previous_window = vim.api.nvim_get_current_win()
              Snacks.picker.explorer()
            elseif explorer_pickers[1]:is_focused() then
              if
                previous_buffer
                and vim.api.nvim_buf_is_valid(previous_buffer)
                and previous_window
                and vim.api.nvim_win_is_valid(previous_window)
              then
                vim.api.nvim_set_current_win(previous_window)
                vim.api.nvim_win_set_buf(previous_window, previous_buffer)
              end
            else
              previous_buffer = vim.api.nvim_get_current_buf()
              previous_window = vim.api.nvim_get_current_win()
              explorer_pickers[1]:focus()
            end
          end
        end)(),
        desc = "Toggle Snacks Explorer",
      },
      {
        "<leader>\\",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
    },
  },
}
-- function()
--       local previous_buffer = nil
--       local previous_window = nil
--
--       return function()
--         local explorer_pickers = Snacks.picker.get({ source = "explorer" })
--         if #explorer_pickers == 0 then
--           previous_buffer = vim.api.nvim_get_current_buf()
--           previous_window = vim.api.nvim_get_current_win()
--           Snacks.picker.explorer()
--         elseif explorer_pickers[1]:is_focused() then
--           if
--             previous_buffer
--             and vim.api.nvim_buf_is_valid(previous_buffer)
--             and previous_window
--             and vim.api.nvim_win_is_valid(previous_window)
--           then
--             vim.api.nvim_set_current_win(previous_window)
--             vim.api.nvim_win_set_buf(previous_window, previous_buffer)
--           end
--         else
--           previous_buffer = vim.api.nvim_get_current_buf()
--           previous_window = vim.api.nvim_get_current_win()
--           explorer_pickers[1]:focus()
--         end
--       end
--     end)()
