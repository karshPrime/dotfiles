--------------------------------------------------------------------------------
--# TMUX Related Plugins #------------------------------------------------------

vim.pack.add({
    'https://github.com/christoomey/vim-tmux-navigator', -- vim tmux keybinds
    'https://github.com/karshPrime/tmux-compile.nvim',   -- execute in tmux
})

--# TMUX Compile #--------------------------------------------------------------

require('tmux-compile').setup({
	save_session = true,
	overlay_width_percent = 80,
	overlay_height_percent = 75,
    side_width_percent = 50,
    local_config = ".commands",

	build_run_config = {{
		extension = {'c', 'cpp', 'h'},
        cd_root   =  true,
		build     = 'make',
		run       = 'make run',
	},{
		extension = {'rs'},
		build     = 'cargo build',
		run       = 'cargo run',
	},{
		extension = {'go'},
        cd_root   = true,
		run       = 'go run .',
		build     = 'go build .'
	},{
		extension = {'py'},
        cd_root   = true,
		run       = 'uv run main',
        build     = 'uv run pyinstaller --onefile --name bin --specpath ./build --console --noconfirm ./*/__main__.py'
	}},
})

Map('<leader>rr', ':TMUXcompile Run<CR>')
Map('<leader>r[', ':TMUXcompile RunV<CR>')
Map('<leader>r]', ':TMUXcompile RunH<CR>')
Map('<leader>r\\',':TMUXcompile RunBG<CR>')

Map('<leader>bb', ':TMUXcompile Make<CR>')
Map('<leader>b[', ':TMUXcompile MakeV<CR>')
Map('<leader>b]', ':TMUXcompile MakeH<CR>')
Map('<leader>b\\',':TMUXcompile MakeBG<CR>')

