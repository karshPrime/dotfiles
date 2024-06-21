-------------------------------------------------------------------------------
--# Editor #-------------------------------------------------------------------

--# Git Gutter #---------------------------------------------------------------

vim.g.gitgutter_enabled = 1       -- Enable GitGutter always
vim.o.signcolumn = 'yes'          -- Always show the sign column (gutter)

vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutter guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutterAdd guifg=green ctermfg=green')
vim.cmd('highlight GitGutterChange guifg=blue ctermfg=blue')
vim.cmd('highlight GitGutterDelete guifg=red ctermfg=red')


--# Better Commenting #--------------------------------------------------------

require('Comment').setup()


--# Discord Presence #---------------------------------------------------------

require('cord').setup()
vim.keymap.set('n','<leader>D', ':CordTogglePresence<CR>', {silent=true})

