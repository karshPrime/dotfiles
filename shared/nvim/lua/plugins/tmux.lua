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
		build = 'go build -race -o ./bin/test main.go'
	}}
})


Map('<M-g>', ':TMUXcompile lazygit<CR>')

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


--# Switch Sessions fron nvim #------------------------------------------------
--* not a plugin

local function tmux_fzf_switch_session()
	local fzf_cmd = 'fzf --cycle -i --layout=reverse --tmux bottom,100,15'
	local cmd = 'tmux ls | ' .. fzf_cmd .. ' | cut -f 1 -d ":"'

	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()

	result = result:gsub("%s+", "")

	if result and result ~= "" then
		vim.fn.system('tmux switch-client -t ' .. result)
	end
end

Map('<M-s>', tmux_fzf_switch_session)

