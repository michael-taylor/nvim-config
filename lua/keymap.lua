local t_builtin = require('telescope.builtin')
local map = vim.keymap.set
local noremap = { noremap = true, silent = true }

-- Set space as leader key
vim.g.mapleader = ' '

-- Use 'jk' instead of ESC in insert mode
map('i', 'jk', '<ESC>', noremap)

-- Setup Telescope bindings
map('n', '<leader>ff', t_builtin.find_files, {})
map('n', '<leader>fg', t_builtin.live_grep, {})
map('n', '<leader>fb', t_builtin.buffers, {})
map('n', '<leader>fh', t_builtin.help_tags, {})