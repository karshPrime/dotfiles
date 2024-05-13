-------------------------------------------------------------------------------
--# Only TMUX #----------------------------------------------------------------

require('only_tmux').setup({
    new_window_name = "session"
})

vim.keymap.set('n', '<leader>o', ':lua require("only_tmux").tmuxCloseAll()<CR>', 
    { noremap = true, silent = true })

vim.keymap.set('n', '<leader>O', ':lua require("only_tmux").tmuxMoveOthers()<CR>', 
    { noremap = true, silent = true })

