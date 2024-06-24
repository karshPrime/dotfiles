-------------------------------------------------------------------------------
--# TMUX Related Plugins #-----------------------------------------------------

--# TMUX Compile #-------------------------------------------------------------

require('tmux-compile').setup({
    overlay_width_percent = 95,
    overlay_height_percent = 95,
    build_run_config = {
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
    }
})

vim.keymap.set('n','<leader>g', ':w<CR> :TMUXcompile lazygit<CR>', {silent=true})

vim.keymap.set('n','<leader>`', ':w<CR> :TMUXcompile Run<CR>',{silent=true})
vim.keymap.set('n','[]<leader>', ':w<CR> :TMUXcompile RunBG<CR>',{silent=true})
vim.keymap.set('n','<leader>]', ':w<CR> :TMUXcompile RunV<CR>', {silent=true})
vim.keymap.set('n','<leader>[', ':w<CR> :TMUXcompile RunH<CR>', {silent=true})

vim.keymap.set('n','`<leader>`', ':w<CR> :TMUXcompile Make<CR>', {silent=true})
vim.keymap.set('n','][<leader>', ':w<CR> :TMUXcompile MakeBG<CR>', {silent=true})

--# Only TMUX #----------------------------------------------------------------

require('only_tmux').setup({ new_window_name = "session" })

vim.keymap.set('n', '<leader>o', ':TMUXonly close<CR>', { silent = true })
vim.keymap.set('n', '<leader>O', ':TMUXonly move<CR>', { silent = true })

