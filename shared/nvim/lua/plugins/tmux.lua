-------------------------------------------------------------------------------
--# TMUX Related Plugins #-----------------------------------------------------

--# TMUX Compile #-------------------------------------------------------------

require('tmux-compile').setup({
    save_session = true,
    sleep_duration = 0,
    overlay_width_percent = 95,
    overlay_height_percent = 95,


    build_run_config = {{
        extension = {'c', 'cpp', 'h'},
        build = 'make',
        run = 'make run',
        debug = 'lldb',
    },{
        extension = {'rs'},
        build = 'cargo build',
        run = 'cargo run',
    },{
        extension = {'go'},
        run = 'go run .',
        build = 'go build'
    }}
})

vim.keymap.set('n','<leader>g', ':TMUXcompile lazygit<CR>', {silent=true})

vim.keymap.set('n','<leader>`', ':TMUXcompile Run<CR>'    , {silent=true})
vim.keymap.set('n','[]<leader>', ':TMUXcompile RunBG<CR>' , {silent=true})
vim.keymap.set('n','<leader>]', ':TMUXcompile RunV<CR>'   , {silent=true})
vim.keymap.set('n','<leader>[', ':TMUXcompile RunH<CR>'   , {silent=true})

vim.keymap.set('n','<leader>d', ':TMUXcompile Debug<CR>'  , {silent=true})
vim.keymap.set('n','`<leader>`', ':TMUXcompile Make<CR>'  , {silent=true})
vim.keymap.set('n','][<leader>', ':TMUXcompile MakeBG<CR>', {silent=true})

--# Only TMUX #----------------------------------------------------------------

require('only_tmux').setup({ new_window_name = "session" })

vim.keymap.set('n', '<leader>o', ':TMUXonly close<CR>', { silent = true })
vim.keymap.set('n', '<leader>O', ':TMUXonly move<CR>', { silent = true })

