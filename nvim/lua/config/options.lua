local o = vim.o

o.expandtab = true
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 2        -- num of space characters per tab
o.shiftwidth = 2     -- spaces per indentation levelw
o.relativenumber = true
o.scrolloff = 999
o.shortmess = "I"

o.ignorecase = true
o.smartcase = true

vim.cmd.colorscheme("tokyonight")
