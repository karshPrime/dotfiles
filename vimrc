-- init.lua

----------------------------------------------------------------------------------------
-- Ensure Packer is installed ----------------------------------------------------------

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end


----------------------------------------------------------------------------------------
-- Initialize Packages -----------------------------------------------------------------

require('packer').startup(function()
    use 'wbthomason/packer.nvim'         -- packer manages itself
    use 'tpope/vim-commentary'           -- easier Commenting
    use 'nvim-tree/nvim-tree.lua'        -- file tree
    use 'nvim-tree/nvim-web-devicons'    -- icons
    use 'nvim-lualine/lualine.nvim'      -- statusbar
    use 'christoomey/vim-tmux-navigator' -- vim tmux keybinds
    use 'airblade/vim-gitgutter'         -- git 
    use 'mg979/vim-visual-multi'         -- multiple cursors (ctrl+n)
    use 'stankovictab/mgz.nvim'		 -- color theme

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
    }

    use {  -- telescope
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- :PackerInstall or :PackerSync
end)


----------------------------------------------------------------------------------------
-- Key Bindings ------------------------------------------------------------------------

-- Make :W work same as :w
vim.cmd([[command! -nargs=0 W w]])

-- Explore mode
vim.api.nvim_set_keymap('n', 'ZE', 
    ':Ex<CR>',
    { noremap = true, silent = true }
)

-- Explore mode on new pane on RHS
vim.api.nvim_set_keymap('n', 'ZV', 
    ':vsplit | :Explore<CR>',
    { noremap = true, silent = true }
)

-- Explore mode on new pane at Bottom
vim.api.nvim_set_keymap('n', 'ZH', 
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


-- Map <leader>n to clear search highlights (:noh)
vim.api.nvim_set_keymap('n', '<leader>l', 
    ':set colorcolumn=120<CR>',
    { noremap = true, silent = true }
)

-- Map <leader>n to clear search highlights (:noh)
vim.api.nvim_set_keymap('n', '<leader>L', 
    ':set colorcolumn=<CR>', 
    { noremap = true, silent = true }
)

----------------------------------------------------------------------------------------
-- Color Theme -------------------------------------------------------------------------
vim.g.mgz_disable_background = true
vim.cmd.colorscheme("mgz")


----------------------------------------------------------------------------------------
-- Additions ---------------------------------------------------------------------------

vim.o.clipboard = "unnamedplus"
vim.cmd('let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"')

vim.cmd('syntax enable')
vim.cmd('set laststatus=3')
vim.cmd('set nu relativenumber')
vim.cmd('set nocompatible')
vim.cmd('set linebreak')
vim.cmd('set showbreak=+++')
vim.cmd('set textwidth=120')

vim.cmd('set showmatch')
vim.cmd('set visualbell')

vim.cmd('set hlsearch')
vim.cmd('set smartcase')
vim.cmd('set ignorecase')
vim.cmd('set incsearch')

vim.cmd('set autoindent')
vim.cmd('set shiftwidth=4')
vim.cmd('set smartindent')
vim.cmd('set smarttab')
vim.cmd('set softtabstop=4')

vim.cmd('set ruler')
vim.cmd('set undolevels=1000')
vim.cmd('set backspace=indent,eol,start')


----------------------------------------------------------------------------------------
-- Config Nvim-CMP ---------------------------------------------------------------------

local cmp = require'cmp'

cmp.setup({
    snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	end,
    },

    window = {
	-- completion = cmp.config.window.bordered(),
	-- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	-- Accept currently selected item. Set `select` to `false` to only confirm 
	-- explicitly selected items.
    }),

    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' }, -- For vsnip users.
	-- { name = 'luasnip' }, -- For luasnip users.
	-- { name = 'ultisnips' }, -- For ultisnips users.
	-- { name = 'snippy' }, -- For snippy users.
    }, {
	{ name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
	{ name = 'git' },
    }, {
	{ name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?`
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
	{ name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' 
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
	{ name = 'path' }
    }, {
	{ name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}

require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}

-- require('lspconfig')['julials'].setup {
--     capabilities = capabilities
-- }

-- require('lspconfig')['pyright'].setup {
--     capabilities = capabilities
-- }


----------------------------------------------------------------------------------------
-- Config LSP --------------------------------------------------------------------------

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").rust_analyzer.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").gopls.setup {}
-- require("lspconfig").julials.setup {}


----------------------------------------------------------------------------------------
-- Config Statusline -------------------------------------------------------------------

require('lualine').setup()

-- config border line colour
vim.cmd('highlight VertSplit guifg=#ff5555 guibg=NONE ctermfg=160 ctermbg=NONE')



----------------------------------------------------------------------------------------
-- Config Git Gutter -------------------------------------------------------------------

vim.g.gitgutter_enabled = 1       -- Enable GitGutter always
vim.o.signcolumn = 'yes'          -- Always show the sign column (gutter)

vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutter guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutterAdd guifg=green ctermfg=green')
vim.cmd('highlight GitGutterChange guifg=blue ctermfg=blue')
vim.cmd('highlight GitGutterDelete guifg=red ctermfg=red')


----------------------------------------------------------------------------------------
-- Config Nvim-tree --------------------------------------------------------------------

require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', 'ZX', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

----------------------------------------------------------------------------------------
-- Config Telescope --------------------------------------------------------------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>z', builtin.git_files, {})
vim.keymap.set('n', '<leader>x', builtin.buffers, {})
vim.keymap.set('n', '<leader>c', builtin.find_files, {})
vim.keymap.set('n', '<leader>a', builtin.live_grep, {})
vim.keymap.set('n', '<leader>s', builtin.help_tags, {})

