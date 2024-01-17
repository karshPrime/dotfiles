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
    use 'wbthomason/packer.nvim'         -- Packer manages itself
    use 'tpope/vim-commentary'           -- Easier Commenting
    use 'nvim-tree/nvim-tree.lua'        -- File tree
    use 'nvim-tree/nvim-web-devicons'    -- icons
    use 'nvim-lualine/lualine.nvim'      -- statusbar
    use 'christoomey/vim-tmux-navigator' -- vim tmux keybinds
    use 'airblade/vim-gitgutter'         -- git 
    use 'mg979/vim-visual-multi'         -- multiple cursors (ctrl+n)

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

    -- :PackerInstall or :PackerSync
end)


----------------------------------------------------------------------------------------
-- Key Bindings ------------------------------------------------------------------------

-- Explore mode
vim.api.nvim_set_keymap('n', 'ZE', ':Ex<CR>', { 
    noremap = true, 
    silent = true 
})

-- Explore mode on new pane on RHS
vim.api.nvim_set_keymap('n', 'ZH', ':vsplit | :Explore<CR>', {
    noremap = true,
    silent = true
})

-- Explore mode on new pane on LHS
vim.api.nvim_set_keymap('n', 'ZV', ':split | :Explore<CR>', {
    noremap = true,
    silent = true 
})


----------------------------------------------------------------------------------------
-- Additions ---------------------------------------------------------------------------

vim.opt.clipboard="unnamedplus"

vim.cmd('syntax enable')
vim.cmd('set laststatus=3')
vim.cmd('set nu relativenumber')
vim.cmd('set nocompatible')
vim.cmd('set linebreak')
vim.cmd('set showbreak=+++')
vim.cmd('set textwidth=80')

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

require('lspconfig')['julials'].setup {
    capabilities = capabilities
}


----------------------------------------------------------------------------------------
-- Config LSP --------------------------------------------------------------------------

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").rust_analyzer.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").julials.setup {}


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


