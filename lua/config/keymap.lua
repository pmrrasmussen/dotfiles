vim.g.mapleader = " "

vim.keymap.set("n", "<leader>s", "0f(a^M<Esc>vib:s/, /,\r/g^M=ab", { desc = "Put method arguments on separate lines" })
