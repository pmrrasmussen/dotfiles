local map = vim.keymap.set

-- Leave search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Stop highlighting search" })

-- Using H/L to go to the begining and the end of line
map({ "n", "v" }, "H", "_", { desc = "Jump to start of line" })
map({ "n", "v" }, "L", "$", { desc = "Jump to end of line" })

-- Integrate better with the system clipboard
map({ "n", "v" }, "<leader>y", '"*y', { desc = "Copy to clipboard" })
map({ "n", "v" }, "<leader>p", '"*p', { desc = "Paste to clipboard" })
map({ "n", "v" }, "<leader>P", '"*P', { desc = "Paste to clipboard" })

-- Quickfix
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" })
map("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quickfix" })
