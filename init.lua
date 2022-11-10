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
vim.opt.timeoutlen = 500

-- Set scroll context
vim.opt.scrolloff = 10

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

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
		hl.Whitespace = {
			fg = colors.bg_highlight
		}
	end,
})
vim.cmd[[colorscheme tokyonight-moon]]

-- Setup devicons
require('nvim-web-devicons').setup()

-- Setup lualine
require('lualine').setup()

-- Setup indent-blankline
require('indent_blankline').setup({
	char = '▏',
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	use_treesitter = false,
	show_current_context = false
})

-- Setup Comment
require('Comment').setup()

-- Setup nvim-tree
require('nvim-tree').setup()

-- Copy libfzf to correct location
-- TODO: make this non-Windows compatible
local src_file = vim.fn.stdpath('config')..'\\prerequisites\\libfzf_native\\libfzf.dll'
local dest_dir = vim.fn.stdpath('config')..'\\pack\\plugins\\start\\telescope-fzf-native.nvim\\build'
if vim.fn.empty(vim.fn.glob(dest_dir)) > 0 then
	print('Copying fzf library to plugin dir...')
	vim.api.nvim_command('!mkdir '..dest_dir)
	vim.api.nvim_command('!copy '..src_file..' '..dest_dir)
end

-- Setup telescope
require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}
require('telescope').load_extension('fzf')

-- Setup our keymap
require('keymap')