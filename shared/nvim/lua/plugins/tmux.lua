-------------------------------------------------------------------------------
--# TMUX Related Plugins #-----------------------------------------------------

--# TMUX Compile #-------------------------------------------------------------

require('tmux-compile').setup({
    {
        extension = {'c', 'cpp', 'h'},
        build = 'make',
        run = 'make run',
    },
    {
        extension = {'rs'},
        build = 'cargo build',
        run = 'cargo run',
    },
})

-- compile and run
vim.keymap.set('n', 'v<F5>', ':TMUXcompile RunV<CR>',
    { noremap = true, silent = true })

vim.keymap.set('n', 'h<F5>', ':TMUXcompile RunH<CR>',
    { noremap = true, silent = true })

vim.keymap.set('n', '<F5>', ':TMUXcompile RunBG<CR>',
    { noremap = true, silent = true })

-- just compile 
vim.keymap.set('n', '<leader><F5>', ':TMUXcompile Make<CR>',
    { noremap = true, silent = true })


--# Only TMUX #----------------------------------------------------------------

require('only_tmux').setup({
    new_window_name = "session"
})

vim.keymap.set('n', '<leader>o',
    ':lua require("only_tmux").tmuxCloseAll()<CR>', 
    { noremap = true, silent = true }
)

vim.keymap.set('n', '<leader>O',
    ':lua require("only_tmux").tmuxMoveOthers()<CR>', 
    { noremap = true, silent = true }
)

