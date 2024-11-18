local map = vim.keymap.set

-- map for quick quit, save files using leader key
---- Normal mode
map("n", "<Leader>s", ":write<CR>")
map("n", "<Leader>a", ":wqa<CR>")
map("n", "<Leader>X", ":q<CR>")

-- Leave search
map("n", "<Leader>/", ":noh<cr>", { desc = "Clear search" })

-- map U to redo
map("n", "U", "<C-r>", {})

-- Using H/L to go to the begining and the end of line
map("n", "H", "_", { desc = "Jump to start of line" })
map("n", "L", "$", { desc = "Jump to end of line" })
