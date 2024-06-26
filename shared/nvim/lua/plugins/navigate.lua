-------------------------------------------------------------------------------
--# Navigate #-----------------------------------------------------------------

--# Telescope #----------------------------------------------------------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>z', builtin.git_files)
vim.keymap.set('n', '<leader>x', builtin.find_files)

vim.keymap.set('n', '<leader>c', builtin.buffers)
vim.keymap.set('n', '<leader>m', builtin.marks)

vim.keymap.set('n', '<leader>n', ':Telescope noice<CR>')
vim.keymap.set('n', '<leader>b', builtin.live_grep)
vim.keymap.set('n', '<leader>p', builtin.registers)


--# Nvim-tree #----------------------------------------------------------------

require("nvim-tree").setup()

vim.keymap.set('n', 'ZX', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

require("nvim-tree").setup({
  on_attach = on_attach,
})

