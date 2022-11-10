-- Prerequisites:
--   * NeoVim 0.8.0+

-- On Windows, start by importing Windows compatibility config
if jit.os == 'Windows' then
	vim.cmd('source $VIMRUNTIME/mswin.vim')
end

-- Set default encoding
vim.opt.encoding = 'UTF-8'

-- Set vertical column guides
vim.opt.colorcolumn = '100,120'

-- Set default editing behavior
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.expandtab = false

-- Ignore octal number format
vim.opt.nrformats:remove('octal')

-- Show whitespace
vim.opt.listchars = 'tab:◀━▶,extends:›,precedes:‹,nbsp:·,trail:·'
vim.opt.list = true

-- Set line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Set timeout for which-key
vim.opt.timeoutlen = 200

-- Set scroll context
vim.opt.scrolloff = 10

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set space as leader key
vim.g.mapleader = ' '