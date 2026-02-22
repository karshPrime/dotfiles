-------------------------------------------------------------------------------
--# Navigate #-----------------------------------------------------------------

--# Telescope #----------------------------------------------------------------

local telescope = require('telescope')

telescope.setup{
	defaults = {
		layout_config = {
			horizontal = {
				preview_width = 0.55,
				results_width = 0.45,
			},
			vertical = {
				preview_height = 0.6,
			},
			width = 0.8,
			height = 0.8,
		},
		layout_strategy = 'horizontal',
		selection_caret = "▶ ",
        prompt_prefix = " ",

	},
}

local builtin = require('telescope.builtin')

Map('<leader>z', builtin.git_files)
Map('<leader>x', builtin.buffers)
Map('<leader>c', builtin.find_files)
Map('<leader>m', builtin.marks)

Map('<leader>n', ':Telescope noice<CR>')
Map('<leader>g', builtin.live_grep)
Map('<leader>v', builtin.registers)
Map('<leader>k', builtin.keymaps)

