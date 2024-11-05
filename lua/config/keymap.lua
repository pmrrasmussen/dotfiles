local map = vim.keymap.set

vim.g.mapleader = " "

-- map for quick quit, save files using leader key
---- Normal mode
map('n', '<Leader>s', ':write<CR>')
map('n', '<Leader>a', ':wqa<CR>')
map('n', '<Leader>x', ':q<CR>')

-- Leave search
map('n', '<Leader>/', ':noh<cr>', { desc = 'Clear search' })

-- map U to redo
map('n', 'U', '<C-r>', {})

-- Using H/L to go to the begining and the end of line
-- Note: H will map to _ (the first non-whitespace character of a line)
-- It would be helpful if it is a indent line in some languages like Python, Ruby, YAML, ...
map('n', 'H', '_', { desc = 'Jump to start of line' })
map('n', 'L', '$', { desc = 'Jump to end of line' })

---- Do some magic with autocmd
-- Remove trailing space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
