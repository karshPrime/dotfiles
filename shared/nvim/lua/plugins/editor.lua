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


--# Scroll Animations #--------------------------------------------------------

require('cinnamon').setup {
    default_delay = 2,
    max_length = 500,
    scroll_limit = -1,
    extra_keymaps = true,
    extended_keymaps = true,
    override_keymaps = true,
}


--# Better Commenting #--------------------------------------------------------

require('Comment').setup()

