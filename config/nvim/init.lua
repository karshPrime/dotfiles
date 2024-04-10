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
    use 'kylechui/nvim-surround'	 -- wrap around text
    use 'folke/which-key.nvim'           -- more info for keybinds

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

    -- :PackerInstall :PackerSync
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


-- Map <leader>l to clear search highlights (:noh)
vim.api.nvim_set_keymap('n', '<leader>l', 
    ':set colorcolumn=100<CR>',
    { noremap = true, silent = true }
)

-- Map <leader>L to clear search highlights (:noh)
vim.api.nvim_set_keymap('n', '<leader>L', 
    ':set colorcolumn=<CR>', 
    { noremap = true, silent = true }
)


----------------------------------------------------------------------------------------
-- Additions ---------------------------------------------------------------------------

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
vim.cmd('set shiftwidth=4')
vim.cmd('set smartindent')
vim.cmd('set smarttab')
vim.cmd('set softtabstop=4')

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
-- Config Plugins ----------------------------------------------------------------------

------------------------------------------------------------------------- Color Theme --

vim.g.mgz_disable_background = true
vim.cmd.colorscheme("mgz")

-------------------------------------------------------------------------- Statusline --

require('lualine').setup()

-- border line colour
vim.cmd('highlight VertSplit guifg=#ff5555 guibg=NONE ctermfg=160 ctermbg=NONE')


---------------------------------------------------------------------------- Surround --

require("nvim-surround").setup()


-------------------------------------------------------------------------- Git Gutter --

vim.g.gitgutter_enabled = 1       -- Enable GitGutter always
vim.o.signcolumn = 'yes'          -- Always show the sign column (gutter)

vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutter guibg=NONE ctermbg=NONE')
vim.cmd('highlight GitGutterAdd guifg=green ctermfg=green')
vim.cmd('highlight GitGutterChange guifg=blue ctermfg=blue')
vim.cmd('highlight GitGutterDelete guifg=red ctermfg=red')


--------------------------------------------------------------------------- Nvim-tree --

require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', 'ZX', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

require("nvim-tree").setup({
  on_attach = on_attach,
})


---------------------------------------------------------------------------- Surround --

require("nvim-surround").setup({})

--  USAGE
--  Old text                    Command         New text
-----------------------------------------------------------------------
--  surr*ound_words             ysiw)           (surround_words)
--  *make strings               ys$"            "make strings"
--  [delete ar*ound me!]        ds]             delete around me!
--  remove <b>HTML t*ags</b>    dst             remove HTML tags
--  'change quot*es'            cs'"            "change quotes"
--  <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--  delete(functi*on calls)     dsf             function calls


--------------------------------------------------------------------------- Which Key --

vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {}


--------------------------------------------------------------------------- Telescope --

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>a', builtin.git_commits, {})
vim.keymap.set('n', '<leader>q', builtin.git_status, {})
vim.keymap.set('n', '<leader>z', builtin.git_files, {})

vim.keymap.set('n', '<leaderdx', builtin.find_files, {})
vim.keymap.set('n', '<leader>c', builtin.buffers, {})

vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set('n', '<leader>d', builtin.marks, {})

