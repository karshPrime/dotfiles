-------------------------------------------------------------------------------
--# TMUX Related Plugins #-----------------------------------------------------

--# TMUX Compile #-------------------------------------------------------------

require('tmux-compile').setup({
    save_session = true,
    sleep_duration = 0,
    overlay_width_percent = 80,
    overlay_height_percent = 75,

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


Map('<C-g>', ':TMUXcompile lazygit<CR>')

Map('<leader>`', ':TMUXcompile Run<CR>')
Map('<leader>|', ':TMUXcompile RunBG<CR>')
Map('<leader>]', ':TMUXcompile RunV<CR>')
Map('<leader>[', ':TMUXcompile RunH<CR>')

Map('<leader>d', ':TMUXcompile Debug<CR>')
Map('<leader>~', ':TMUXcompile Make<CR>')
Map('|<leader>', ':TMUXcompile MakeBG<CR>')

--# Only TMUX #----------------------------------------------------------------

require('only_tmux').setup({ new_window_name = "session" })

Map('<leader>o', ':TMUXonly close<CR>')
Map('<leader>O', ':TMUXonly move<CR>')

