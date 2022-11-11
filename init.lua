-- Prerequisites:
--   * NeoVim 0.8.0+
--   * Nerd Fonts distribution of Hack font (included)
--   * RipGrep should be in PATH (included for Windows, ripgrep package on Linux)
--   * fd should be in PATH (included for Windows, fd-find package on Linux)
--   * tree-sitter should be in PATH (included)

local utils = require('utils')

-- On Windows, start by importing Windows compatibility config
local os_name = 'linux'
local lib_sfx = '.so'
if jit.os == 'Windows' then
	os_name = 'windows'
	lib_sfx = '.dll'
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

-- Setup alpha-nvim
require('alpha').setup(require('dashboard').config)

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
	                vim.fn.stdpath('config')..'/prerequisites/treesitter-parsers/' .. os_name .. '/parser',
	                vim.fn.stdpath('config')..'/pack/plugins/start/nvim-treesitter/parser')
	utils.copy_file(parser..'.revision',
	                vim.fn.stdpath('config')..'/prerequisites/treesitter-parsers/' .. os_name .. '/parser-info',
	                vim.fn.stdpath('config')..'/pack/plugins/start/nvim-treesitter/parser-info')
end
require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			}
		},
	},
	ensure_installed = treesitter_langs,
})

-- Setup lualine
require('lualine').setup({
	sections = {
		lualine_c = { require('auto-session-library').current_session_name },
	},
	extensions = {
		'fzf',
		'nvim-tree',
	},
})

-- Setup indent-blankline
require('indent_blankline').setup({
	char = '▏',
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	use_treesitter = true,
	show_current_context = false
})

-- Setup Comment
require('Comment').setup()

-- Setup nvim-tree
require('nvim-tree').setup({
	on_attach = function(bufnr)
		-- According to nvim-tree docs, this is the best place to set nvim-tree keybindings
		local bufmap = function(lhs, rhs, desc)
			vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
		end

		local api = require('nvim-tree.api')

		bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
	end
})

-- Copy libfzf to correct location
utils.copy_file('libfzf' .. lib_sfx,
                vim.fn.stdpath('config')..'/prerequisites/libfzf_native',
                vim.fn.stdpath('config')..'/pack/plugins/start/telescope-fzf-native.nvim/build')

-- Setup telescope
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
			}
		}
	},
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

-- Setup auto-session
require("auto-session").setup {
	log_level = "error",
	auto_save_enabled = false,
	auto_restore_enabled = false,

	cwd_change_handling = {
		post_cwd_changed_hook = function()
			require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
		end,
	},
}

-- Setup our keymap
require('keymap')
