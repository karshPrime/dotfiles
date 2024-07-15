-------------------------------------------------------------------------------
--# Editor #-------------------------------------------------------------------

--# RIP-Substitute #-----------------------------------------------------------

vim.keymap.set(
	{ "n", "x" },
	"<space>s",
	function() require("rip-substitute").sub() end,
	{ desc = " rip substitute" }
)

--# Git Gutter #---------------------------------------------------------------

vim.g.gitgutter_enabled = 1       -- Enable GitGutter always
vim.o.signcolumn = 'yes'          -- Always show the sign column (gutter)


--# Better Commenting #--------------------------------------------------------

require('Comment').setup()

