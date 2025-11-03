
"- Config ---------------------------------------------------------------------------------------- "

syntax enable

set laststatus=3
set nu relativenumber
set nocompatible
set linebreak
set textwidth=100
set termguicolors

set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set smartindent
set breakindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set undolevels=1000
set backspace=indent,eol,start


"- Keybinds -------------------------------------------------------------------------------------- "

" Default Override
nnoremap ZZ :wqall<CR>

" Conveniences
command! -nargs=0 W w
command! -nargs=0 Wq wq

" Yank to system clipboard by default
nnoremap y "+y
vnoremap y "+y
inoremap <C-y> <C-o>"+y

" Delete and copy to system clipboard by default
nnoremap d "+d
vnoremap d "+d
inoremap <C-d> <C-o>"+d

" Paste from system clipboard by default
nnoremap p "+p
vnoremap p "+p
inoremap <C-p> <C-o>"+p

" delete without buffer
nnoremap s "_d
nnoremap S "_d$a
nnoremap X "_x

" Windows
nnoremap <leader>l :call ToggleColumn()<CR>
nnoremap <leader>w :call RotatePanes()<CR>
nnoremap ZE :Ex<CR>

" to whole file
nnoremap sA gg"_dG<CR>
nnoremap dA :%delete<CR>
nnoremap yA :%yank<CR>
nnoremap =A myLgg=G``zb`y<CR>:%s/ *$//g<CR>
nnoremap <leader>R gg"_dGp<CR>

" faster actions
nnoremap <space>/ /--#<CR> kztj<CR>
nnoremap <space>s :%s/
nnoremap <M-z> zfi{
nnoremap <M-Z> zo

" Inserts
inoremap <M-9> (  )<Left><Left>
inoremap <M-{> {  }<Left><Left>
inoremap <M-[> []<Left>
inoremap <M-"> ""<Left>
inoremap <M-'> ''<Left>

" autoclose brackets: stay out
inoremap <M-0> ()
inoremap <M-)> ( void )<CR>{<CR>}<Esc>O
inoremap <M-]> []
inoremap <M-}> {}

" common actions
inoremap <M-;> <Esc>A;
inoremap <M-=>  ==
inoremap <M-+> !=
inoremap =  =
inoremap *  *
inoremap , ,

" hjkl nav in insert mode
inoremap <M-h> <Esc>ha
inoremap <M-j> <Esc>ja
inoremap <M-k> <Esc>ka
inoremap <M-l> <Esc>la
inoremap <M-i> <Esc>I
inoremap <M-a> <Esc>A

" insert new line
nnoremap <leader>{ <Esc>o{<CR>}<Esc>O
inoremap <leader>{ <Esc>o{<CR>}<Esc>O

