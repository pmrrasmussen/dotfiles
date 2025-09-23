local o = vim.o

-- Info
o.shortmess = o.shortmess .. "IAW"

-- Experience
o.mouse = "a"
o.updatetime = 250
o.scrolloff = 15
vim.opt.cursorline = true

-- Editing
o.undofile = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.splitright = true

-- Margins
o.signcolumn = "yes"
o.number = true
o.relativenumber = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Colorscheme
vim.cmd.colorscheme("catppuccin-frappe")
