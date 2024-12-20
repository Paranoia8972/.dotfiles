local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>ff', ':FzfLua files<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>fg', ':FzfLua live_grep<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>fb', ':FzfLua buffers<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>fh', ':FzfLua help_tags<CR>', { noremap = true, silent = true })

keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>p', ':Dashboard<CR>', { noremap = true, silent = true })

keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

keymap('n', '<Leader>j', ':split | terminal<CR>', { noremap = true, silent = true })