local t_builtin = require('telescope.builtin')
local wk = require('which-key')
local map = vim.keymap.set
local noremap = { noremap = true, silent = true }

-- Set space as leader key
vim.g.mapleader = ' '

-- Use 'jk' instead of ESC in insert mode
map('i', 'jk', '<ESC>', noremap)

wk.register({
	w = { '<cmd>:w<cr>', 'Write File' },
	q = { '<cmd>:q<cr>', 'Quit NeoVim' },
	f = {
		name = 'Files',
		f = { t_builtin.find_files, 'Find Files' },
		r = { t_builtin.oldfiles, 'Open Recent Files' },
		t = { '<cmd>NvimTreeToggle<cr>', 'Toggle NvimTree' },
		g = { t_builtin.live_grep, 'Live Grep' },

	},
	b = {
		name = 'Buffers',
		b = { t_builtin.buffers, 'List Open Buffers' },
		s = { t_builtin.current_buffer_fuzzy_find, 'Search in Buffer' },
	},
	h = { t_builtin.help_tags, 'Help Search' },
	s = {
		name = 'Sessions',
		s = { '<cmd>SaveSession<cr>', 'Save Session' },
		r = { '<cmd>RestoreSession<cr>', 'Restore Session' },
		d = { '<cmd>Autosession delete<cr>', 'Delete Session' },
		l = { '<cmd>Autosession search<cr>', 'List Sessions' },
	}
}, { prefix = '<leader>' })
