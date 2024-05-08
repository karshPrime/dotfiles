----------------------------------------------------------------------------------------
--# Navigate #--------------------------------------------------------------------------

--# Telescope #-------------------------------------------------------------------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>a', builtin.git_commits)
vim.keymap.set('n', '<leader>q', builtin.git_status)
vim.keymap.set('n', '<leader>z', builtin.git_files)

vim.keymap.set('n', '<leaderdx', builtin.find_files)
vim.keymap.set('n', '<leader>c', builtin.buffers)

vim.keymap.set('n', '<leader>s', builtin.live_grep)
vim.keymap.set('n', '<leader>d', builtin.marks)


--# Nvim-tree #-------------------------------------------------------------------------

require("nvim-tree").setup()

vim.keymap.set('n', 'ZX', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

require("nvim-tree").setup({
  on_attach = on_attach,
})

