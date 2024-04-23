-- init.lua

----------------------------------------------------------------------------------------
--# Ensure Packer is installed #--------------------------------------------------------

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end


----------------------------------------------------------------------------------------
--# Initialize Packages #---------------------------------------------------------------

require('packer').startup(function()
    use 'wbthomason/packer.nvim'         -- packer manages itself
    use 'tpope/vim-commentary'           -- easier Commenting
    use 'nvim-tree/nvim-tree.lua'        -- file tree
    use 'nvim-tree/nvim-web-devicons'    -- icons
    use 'nvim-lualine/lualine.nvim'      -- statusbar
    use 'christoomey/vim-tmux-navigator' -- vim tmux keybinds
    use 'airblade/vim-gitgutter'         -- git 
    use 'mg979/vim-visual-multi'         -- multiple cursors (ctrl+n)
    use 'folke/which-key.nvim'           -- more info for keybinds
    use 'Shatur/neovim-ayu'              -- color theme
    use 'karshPrime/only-tmux.nvim'      -- tmux panels :only

    use {  -- nvim cmp
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
    }

    use {  -- LSP
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- multiline errors
    }

    use {  -- telescope
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = {'nvim-lua/plenary.nvim'} 
    }

    -- :PackerInstall :PackerSync
end)


----------------------------------------------------------------------------------------
--# Key Bindings #----------------------------------------------------------------------

-- J combines the current line with the one bellow

-- Make :W work same as :w
vim.cmd([[command! -nargs=0 W w]])

-- Explore mode
vim.api.nvim_set_keymap('n', 'ZE', 
    ':Ex<CR>',
    { noremap = true, silent = true }
)

-- Explore mode on new pane on RHS
vim.api.nvim_set_keymap('n', 'ZH', 
    ':vsplit | :Explore<CR>',
    { noremap = true, silent = true }
)

-- Explore mode on new pane at Bottom
vim.api.nvim_set_keymap('n', 'ZV', 
    ':split | :Explore<CR>',
    { noremap = true, silent = true }
)

-- Map F5 key to call upload script
vim.api.nvim_set_keymap('n', '<F5>', 
    ':w<CR>:!./upload.sh<CR>',
    { noremap = true, silent = true }
)

-- Map F6 key to execute cargo run command 
vim.api.nvim_set_keymap('n', '<F6>', 
    ':w<CR>:!cargo run<CR>',
    { noremap = true, silent = true }
)

-- Map F7 key to execute cargo build command 
vim.api.nvim_set_keymap('n', '<F7>', 
    ':w<CR>:!cargo build<CR>',
    { noremap = true, silent = true }
)

-- Map F8 key to execute make command
vim.api.nvim_set_keymap('n', '<F8>', 
    ':w<CR>:term make<CR>',
    { noremap = true, silent = true }
)

-- Map <leader>w to save the file
vim.api.nvim_set_keymap('n', '<leader>w', 
    ':w<CR>', 
    { noremap = true, silent = true }
)

-- Map <leader>n to clear search highlights (:noh)
vim.api.nvim_set_keymap('n', '<leader>n', 
    ':noh<CR>', 
    { noremap = true, silent = true }
)

-- Map <leader>l to show colorcolumn at 100 col
vim.api.nvim_set_keymap('n', '<leader>l', 
    ':set colorcolumn=100<CR>',
    { noremap = true, silent = true }
)

-- Map <leader>L to hide colour column
vim.api.nvim_set_keymap('n', '<leader>L', 
    ':set colorcolumn=<CR>', 
    { noremap = true, silent = true }
)

-- delete everything 
vim.api.nvim_set_keymap('n', 'dA',
    ':norm gg0dG<CR>',
    { noremap = true, silent = true }
)

-- copy everything 
vim.api.nvim_set_keymap('n', 'yA',
    ':norm myLgg0yG``zb`y<CR>',
    { noremap = true, silent = true }
)

-- better up scroll 
vim.api.nvim_set_keymap('n', '<C-u>',
    ':norm Hzz<CR>',
    { noremap = true, silent = true }
)

-- better down scroll
vim.api.nvim_set_keymap('n', '<C-d>',
    ':norm Lzz<CR>',
    { noremap = true, silent = true }
)

-- faster %s 
vim.api.nvim_set_keymap('n', '<space>s',
    ':%s/',
    { noremap = true, silent = false }
)

-- given I use same heading syntax for all configs
vim.api.nvim_set_keymap('n', '<space>/',
    '/--# <CR>',
    { noremap = true, silent = false }
)


----------------------------------------------------------------------------------------
--# Additions #-------------------------------------------------------------------------

vim.o.clipboard = "unnamedplus"
vim.cmd('let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"')

vim.cmd('syntax enable')
vim.cmd('set laststatus=3')
vim.cmd('set nu relativenumber')
vim.cmd('set nocompatible')
vim.cmd('set linebreak')
vim.cmd('set textwidth=100')

vim.cmd('set showmatch')
vim.cmd('set visualbell')

vim.cmd('set hlsearch')
vim.cmd('set smartcase')
vim.cmd('set ignorecase')
vim.cmd('set incsearch')

vim.cmd('set autoindent')
vim.cmd('set smartindent')
vim.cmd('set expandtab') 
vim.cmd('set tabstop=4') 
vim.cmd('set shiftwidth=4') 
vim.cmd('set softtabstop=4')

vim.cmd('set undolevels=1000')
vim.cmd('set backspace=indent,eol,start')


----------------------------------------------------------------------------------------
--# Nvim-CMP #--------------------------------------------------------------------------

local cmp = require'cmp'

cmp.setup({
    snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) 
    end,
    },

    window = { },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    sources = cmp.config.sources(
        { { name = 'nvim_lsp' }, { name = 'vsnip' }, },
        { { name = 'buffer' }, }
    )
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({ { name = 'git' }, }, { { name = 'buffer' }, })
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' 
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})


----------------------------------------------------------------------------------------
--# Config LSP #------------------------------------------------------------------------

--# Language Support #------------------------------------------------------------------

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
require('lspconfig')['clangd'].setup { capabilities = capabilities }
require('lspconfig')['gopls'].setup { capabilities = capabilities }

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").rust_analyzer.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").gopls.setup {}


--# Multiline Errors #------------------------------------------------------------------

require("lsp_lines").setup()
vim.diagnostic.config({ virtual_text = false, })  -- disable default lsp errors

-- toggle errors
vim.keymap.set(
    "",
    "<space><space>",
    require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
)


--# LSP Keybinds #----------------------------------------------------------------------

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<space>k',  vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>D',  vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
    end,
})


----------------------------------------------------------------------------------------
--# Config Plugins #--------------------------------------------------------------------

--# Color Theme #-----------------------------------------------------------------------

require('ayu').colorscheme()
require('ayu').setup({
    overrides = {
        Normal = { bg = "None" },
        ColorColumn = { bg = "#121212" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "#121212" },
        CursorColumn = { bg = "#121212" },
        WhichKeyFloat = { bg = "None" },
        VertSplit = { bg = "None" },
    },
})
vim.cmd.colorscheme("ayu-dark")


--# Statusline #------------------------------------------------------------------------

require('lualine').setup({
  options = {
    theme = 'ayu',
  },
})

-- border line colour
vim.cmd('highlight VertSplit guifg=#555753 guibg=NONE ctermfg=160 ctermbg=NONE')


--# Git Gutter #------------------------------------------------------------------------

vim.g.gitgutter_enabled = 1       -- Enable GitGutter always
vim.o.signcolumn = 'yes'          -- Always show the sign column (gutter)

vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutter guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutterAdd guifg=green ctermfg=green')
vim.cmd('highlight GitGutterChange guifg=blue ctermfg=blue')
vim.cmd('highlight GitGutterDelete guifg=red ctermfg=red')


--# Nvim#-tree -------------------------------------------------------------------------

require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', 'ZX', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

require("nvim-tree").setup({
  on_attach = on_attach,
})


--# Which Key #-------------------------------------------------------------------------

vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {}


--# Only TMUX #-------------------------------------------------------------------------

require('only_tmux').setup({
    new_window_name = "session"
})

vim.api.nvim_set_keymap('n', '<leader>o',
    ':lua require("only_tmux").tmuxCloseAll()<CR>', 
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>O', 
    ':lua require("only_tmux").tmuxMoveOthers()<CR>', 
    { noremap = true, silent = true }
)


--# Telescope #-------------------------------------------------------------------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>a', builtin.git_commits)
vim.keymap.set('n', '<leader>q', builtin.git_status)
vim.keymap.set('n', '<leader>z', builtin.git_files)

vim.keymap.set('n', '<leaderdx', builtin.find_files)
vim.keymap.set('n', '<leader>c', builtin.buffers)

vim.keymap.set('n', '<leader>s', builtin.live_grep)
vim.keymap.set('n', '<leader>d', builtin.marks)

