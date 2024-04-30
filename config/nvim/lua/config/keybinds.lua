----------------------------------------------------------------------------------------
--# Key Bindings #----------------------------------------------------------------------

-- J combines the current line with the one bellow

--# Motions #---------------------------------------------------------------------------

-- better up scroll
vim.keymap.set('n', '<C-u>', ':norm Hzz<CR>',
    { noremap = true, silent = true })

-- better down scroll
vim.keymap.set('n', '<C-d>', ':norm Lzz<CR>',
    { noremap = true, silent = true })


--# Windows #---------------------------------------------------------------------------

-- Explore mode
vim.keymap.set('n', 'ZE', ':Ex<CR>',
    { noremap = true, silent = true })

-- Explore mode on new pane on RHS
vim.keymap.set('n', 'ZH', ':vsplit | :Explore<CR>',
    { noremap = true, silent = true })

-- Explore mode on new pane at Bottom
vim.keymap.set('n', 'ZV', ':split | :Explore<CR>',
    { noremap = true, silent = true })

-- Map <leader>l to show colorcolumn at 90 col
vim.keymap.set('n', '<leader>l', ':set colorcolumn=90<CR>',
    { noremap = true, silent = true })

-- Map <leader>L to hide colour column
vim.keymap.set('n', '<leader>L', ':set colorcolumn=<CR>',
    { noremap = true, silent = true })


--# Development #-----------------------------------------------------------------------

-- Map F5 key to call upload script
vim.keymap.set('n', '<F5>', ':w<CR>:!./upload.sh<CR>',
    { noremap = true, silent = true })

-- Map F6 key to execute cargo run command
vim.keymap.set('n', '<F6>', ':w<CR>:!cargo run<CR>',
    { noremap = true, silent = true })

-- Map F7 key to execute cargo build command
vim.keymap.set('n', '<F7>', ':w<CR>:!cargo build<CR>',
    { noremap = true, silent = true })

-- Map F8 key to execute make command
vim.keymap.set('n', '<F8>', ':w<CR>:term make<CR>',
    { noremap = true, silent = true })

-- CPP quick print
-- vim.keymap.set('n', '<leader>pcpp', ':execute "normal! istd::cout <<  << \"\\n\";\<esc>7hi<CR>"'
--    { noremap = true, silent = true })


--# Conveniences #----------------------------------------------------------------------

-- Make :W work same as :w
vim.cmd([[command! -nargs=0 W w]])

-- Map <leader>w to save the file
vim.keymap.set('n', '<leader>w', ':w<CR>',
    { noremap = true, silent = true })

-- Map <leader>n to clear search highlights (:noh)
vim.keymap.set('n', '<leader>n', ':noh<CR>',
    { noremap = true, silent = true })

-- delete everything
vim.keymap.set('n', 'dA', ':norm gg0dG<CR>',
    { noremap = true, silent = true })

-- yank everything
vim.keymap.set('n', 'yA', ':norm myLgg0yG``zb`y<CR>',
    { noremap = true, silent = true })

-- faster %s
vim.keymap.set('n', '<space>s', ':%s/',
    { noremap = true, silent = false })

-- given I use same heading syntax for all configs
vim.keymap.set('n', '<space>/', '/--# <CR>',
    { noremap = true, silent = false })

-- easier registers view
vim.keymap.set('n', '<leader>r', ':reg<CR>',
    { noremap = true, silent = true })

