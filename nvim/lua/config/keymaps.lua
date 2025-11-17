-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "v" }, "<leader>y", '"*y', { desc = "Copy to clipboard" })
map({ "n", "v" }, "<leader>p", '"*p', { desc = "Paste to clipboard" })
map({ "n", "v" }, "<leader>P", '"*P', { desc = "Paste to clipboard" })

-- Using H/L to go to the begining and the end of line
map({ "n", "v" }, "H", "_", { desc = "Jump to start of line" })
map({ "n", "v" }, "L", "$", { desc = "Jump to end of line" })
