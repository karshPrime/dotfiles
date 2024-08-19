-------------------------------------------------------------------------------
--# TMUX Related Plugins #-----------------------------------------------------

--# TMUX Compile #-------------------------------------------------------------

require('tmux-compile').setup({
	save_session = true,
	overlay_width_percent = 80,
	overlay_height_percent = 75,

	build_run_config = {{
		extension = {'c', 'cpp', 'h'},
		build = 'make',
		run = 'make run',
		debug = 'make debug',
	},{
		extension = {'java'},
		build = './gradlew build',
		run = './gradlew run',
		debug = 'jdb'
	},{
		extension = {'rs'},
		build = 'cargo build',
		run = 'cargo run',
	},{
		extension = {'go'},
		run = 'go run .',
		build = 'echo "Building..."; go build -race -o ./bin/testbuild main.go'
	},{
		extension = {'py'},
		run = 'python main.py'
	}}
})

Map('<M-g>',  ':TMUXcompile lazygit<CR>')
Map('<leader>d',  ':TMUXcompile Debug<CR>')

Map('<leader>rr', ':TMUXcompile Run<CR>')
Map('<leader>r[', ':TMUXcompile RunV<CR>')
Map('<leader>r]', ':TMUXcompile RunH<CR>')
Map('<leader>r\\',':TMUXcompile RunBG<CR>')

Map('<leader>bb', ':TMUXcompile Make<CR>')
Map('<leader>b[', ':TMUXcompile MakeH<CR>')
Map('<leader>b]', ':TMUXcompile MakeH<CR>')
Map('<leader>b\\',':TMUXcompile MakeBG<CR>')


--# Only TMUX #----------------------------------------------------------------

require('only_tmux').setup({ new_window_name = "session" })

Map('<leader>o', ':TMUXonly close<CR>')
Map('<leader>O', ':TMUXonly move<CR>')

