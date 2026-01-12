
---------------------------------------------------------------------------------------------------
--# TMUX Related Plugins #-------------------------------------------------------------------------

--# TMUX Compile #---------------------------------------------------------------------------------

require('tmux-compile').setup({
	save_session = true,
	overlay_width_percent = 80,
	overlay_height_percent = 75,
    side_width_percent = 50,
    local_config = ".commands",

	build_run_config = {{
		extension = {'c', 'cpp', 'h'},
        cd_root   =  true,
		build     = 'cmake -S . -B build && cmake --build build',
		run       = 'cmake -S . -B build && cmake --build build; ./bin',
	},{
		extension = {'rs'},
		build     = 'cargo build',
		run       = 'cargo run',
	},{
		extension = {'go'},
		run       = 'figlet "Run"; go run .',
		build     = 'figlet "Build"; go build .'
	},{
		extension = {'py'},
		run       = 'source ./.venv/bin/activate; python3 main.py'
	}},
})

Map('<M-g>',  ':TMUXcompile lazygit<CR>')
Map('<leader>d',  ':TMUXcompile Debug<CR>')

Map('<leader>rr', ':TMUXcompile Run<CR>')
Map('<leader>r[', ':TMUXcompile RunV<CR>')
Map('<leader>r]', ':TMUXcompile RunH<CR>')
Map('<leader>r\\',':TMUXcompile RunBG<CR>')

Map('<leader>bb', ':TMUXcompile Make<CR>')
Map('<leader>b[', ':TMUXcompile MakeV<CR>')
Map('<leader>b]', ':TMUXcompile MakeH<CR>')
Map('<leader>b\\',':TMUXcompile MakeBG<CR>')


--# Only TMUX #------------------------------------------------------------------------------------

require('only_tmux').setup({ new_window_name = "session" })

Map('<leader>o', ':TMUXonly close<CR>')
Map('<leader>O', ':TMUXonly move<CR>')

