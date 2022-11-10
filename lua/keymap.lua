local map = vim.keymap.set
local noremap = { noremap = true, silent = true }

-- Set space as leader key
vim.g.mapleader = ' '

-- Use 'jk' instead of ESC in insert mode
map('i', 'jk', '<ESC>', noremap)
