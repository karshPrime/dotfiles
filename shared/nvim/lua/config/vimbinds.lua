-------------------------------------------------------------------------------
--# Additions #----------------------------------------------------------------

vim.o.clipboard = "unnamedplus"

vim.cmd('syntax enable')
vim.cmd('set laststatus=3')
vim.cmd('set nu relativenumber')
vim.cmd('set nocompatible')
vim.cmd('set linebreak')
vim.cmd('set textwidth=80')

vim.cmd('set showmatch')
vim.cmd('set visualbell')

vim.cmd('set hlsearch')
vim.cmd('set smartcase')
vim.cmd('set ignorecase')
vim.cmd('set incsearch')

vim.cmd('set autoindent')
vim.cmd('set smartindent')
vim.cmd('set breakindent')
vim.cmd('set expandtab')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set softtabstop=4')

vim.cmd('set undolevels=1000')
vim.cmd('set backspace=indent,eol,start')

vim.cmd('let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"')
vim.cmd('let g:netrw_banner = 0')
vim.cmd('let g:netrw_sort_options = "i"')

