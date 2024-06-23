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

require('cinnamon').setup {
    max_length = 500,
    scroll_limit = -1,
    extra_keymaps = true,
    extended_keymaps = true,
    override_keymaps = true,
}

