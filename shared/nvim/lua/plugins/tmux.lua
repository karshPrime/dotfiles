-------------------------------------------------------------------------------
--# TMUX Related Plugins #-----------------------------------------------------

--# TMUX Compile #-------------------------------------------------------------

require('tmux-compile').setup({ languages = {
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
} })

-- compile and run
vim.keymap.set('n', '<leader>rd',
    ':lua require("tmux-compile.nvim").run_below()<CR>',
    { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rs',
    ':lua require("tmux-compile.nvim").run_side()<CR>',
    { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rn',
    ':lua require("tmux-compile.nvim").run_new_window()<CR>',
    { noremap = true, silent = true })

-- just compile 
vim.keymap.set('n', '<leader>rcd',
    ':lua require("tmux-compile.nvim").compile_below()<CR>',
    { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rcs',
    ':lua require("tmux-compile.nvim").compile_side()<CR>',
    { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rcn',
    ':lua require("tmux-compile.nvim").compile_new_window()<CR>',
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

