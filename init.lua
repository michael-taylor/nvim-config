-- Prerequisites:
--   * NeoVim 0.8.0+
--   * Nerd Fonts distribution of Hack font (included)
--   * RipGrep should be in PATH (included)
--   * fd should be in PATH (included)
--   * tree-sitter should be in PATH (included)

local utils = require('utils')

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

-- Setup treesitter
local treesitter_langs = {
	'bash',
	'c',
	'c_sharp',
	'comment',
	'cpp',
	'css',
	'dart',
	'gitignore',
	'help',
	'html',
	'java',
	'javascript',
	'json',
	'kotlin',
	'lua',
	'make',
	'markdown',
	'python',
	'sql',
	'toml',
	'tsx',
	'typescript',
	'vim',
	'yaml'
}
-- Copy the pre-compiled parsers to nvim-treesitter package
for _, parser in ipairs(treesitter_langs) do
	utils.copy_file(parser..'.so',
	                vim.fn.stdpath('config')..'/prerequisites/treesitter-parsers/parser',
	                vim.fn.stdpath('config')..'/pack/plugins/start/nvim-treesitter/parser')
	utils.copy_file(parser..'.revision',
	                vim.fn.stdpath('config')..'/prerequisites/treesitter-parsers/parser-info',
	                vim.fn.stdpath('config')..'/pack/plugins/start/nvim-treesitter/parser-info')
end
require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
	},
	ensure_installed = treesitter_langs,
})

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
utils.copy_file('libfzf.dll',  -- TODO: Need to support libfzf.so on non-Windows platforms
                vim.fn.stdpath('config')..'/prerequisites/libfzf_native',
                vim.fn.stdpath('config')..'/pack/plugins/start/telescope-fzf-native.nvim/build')

-- Setup telescope
require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case',
		}
	}
}
require('telescope').load_extension('fzf')

-- Setup our keymap
require('keymap')
