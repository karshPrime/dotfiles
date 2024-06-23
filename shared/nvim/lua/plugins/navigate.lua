-------------------------------------------------------------------------------
--# Navigate #-----------------------------------------------------------------

--# Telescope #----------------------------------------------------------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>z', builtin.git_files)
vim.keymap.set('n', '<leader>x', builtin.find_files)

vim.keymap.set('n', '<leader>c', builtin.buffers)
vim.keymap.set('n', '<leader>m', builtin.marks)

vim.keymap.set('n', '<leader>n', ':Telescope noice')
vim.keymap.set('n', '<leader>g', builtin.live_grep)


--# Nvim-tree #----------------------------------------------------------------

require("nvim-tree").setup()

vim.keymap.set('n', 'ZX', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

require("nvim-tree").setup({
  on_attach = on_attach,
})

