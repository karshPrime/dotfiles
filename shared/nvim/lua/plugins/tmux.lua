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
    {
        extension = {'go'},
        build = 'go build',
        run = 'go run .',
    }
})

vim.keymap.set('n', '<leader>]', ':TMUXcompile RunV<CR>',  {silent = true})
vim.keymap.set('n', '<leader>[', ':TMUXcompile RunH<CR>',  {silent = true})
vim.keymap.set('n', '<leader>`', ':TMUXcompile RunBG<CR>', {silent = true})
vim.keymap.set('n', '<leader>\\', ':TMUXcompile Make<CR>', {silent = true})

--# Only TMUX #----------------------------------------------------------------

require('only_tmux').setup({ new_window_name = "session" })

vim.keymap.set('n', '<leader>o', ':TMUXonly close<CR>', { silent = true })
vim.keymap.set('n', '<leader>O', ':TMUXonly move<CR>', { silent = true })

