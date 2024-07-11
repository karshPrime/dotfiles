-------------------------------------------------------------------------------
--# Navigate #-----------------------------------------------------------------

--# Telescope #----------------------------------------------------------------

local builtin = require('telescope.builtin')
Map('<leader>z', builtin.git_files)
Map('<leader>x', builtin.find_files)

Map('<leader>c', builtin.buffers)
Map('<leader>m', builtin.marks)

Map('<leader>n', ':Telescope noice<CR>')
Map('<leader>b', builtin.live_grep)
Map('<leader>p', builtin.registers)


--# Nvim-tree #----------------------------------------------------------------

require("nvim-tree").setup({
  on_attach = on_attach,
})

Map('ZX', ':NvimTreeToggle<CR>')

