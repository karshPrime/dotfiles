
------------------------------------------------------------------------------
--# Shell Bindings #----------------------------------------------------------

--# Switch tmux sessions #-----------------------------------------------------

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

MapV('<M-s>', tmux_fzf_switch_session)

