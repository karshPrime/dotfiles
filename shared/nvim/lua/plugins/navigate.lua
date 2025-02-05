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
Map('<leader>x', builtin.find_files)

Map('<leader>c', builtin.buffers)
Map('<leader>m', builtin.marks)

Map('<leader>n', ':Telescope noice<CR>')
Map('<leader>g', builtin.live_grep)
Map('<leader>p', builtin.registers)
Map('<leader>k', builtin.keymaps)


--# Harpoon #------------------------------------------------------------------

local harpoon = require("harpoon")
harpoon:setup()

Map("<leader>a", function() harpoon:list():add() end)
Map("<leader>v", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

Map("<leader>1", function() harpoon:list():select(1) end)
Map("<leader>2", function() harpoon:list():select(2) end)
Map("<leader>3", function() harpoon:list():select(3) end)
Map("<leader>4", function() harpoon:list():select(4) end)

Map("<leader>,", function() harpoon:list():prev() end)
Map("<leader>.", function() harpoon:list():next() end)

