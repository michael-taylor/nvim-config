-- Prerequisites:
--   * NeoVim 0.8.0+
--   * Nerd Fonts distribution of Hack font (included)

-- On Windows, start by importing Windows compatibility config
if jit.os == 'Windows' then
	vim.cmd('source $VIMRUNTIME/mswin.vim')
end

-- Set font
vim.opt.guifont = 'Hack NF:h10'

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
vim.opt.cursorline = true

-- Set timeout for which-key
vim.opt.timeoutlen = 200

-- Set scroll context
vim.opt.scrolloff = 10

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set space as leader key
vim.g.mapleader = ' '

-- Setup colorscheme
require("tokyonight").setup({
	-- Use the moon style
	style = "moon",
	
	-- Make the line numbers more visible
	on_colors = function(colors)
		colors.fg_gutter = "#707cb2"
	end,
	on_highlights = function(hl, colors)
		hl.CursorLineNr = {
			fg = colors.orange
		}
	end,
})
vim.cmd[[colorscheme tokyonight-moon]]

-- Setup devicons
require('nvim-web-devicons').setup()
