local o = vim.o

-- Info
o.shortmess = "I"

-- Experience
o.mouse = "a"
o.updatetime = 250
o.scrolloff = 15
vim.opt.cursorline = true

-- Editing
o.undofile = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.smartindent = true

-- Margins
o.signcolumn = "yes"
o.number = true
o.relativenumber = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Colorscheme
vim.cmd.colorscheme("catppuccin-macchiato")
