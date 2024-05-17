-------------------------------------------------------------------------------
--# init.lua #-----------------------------------------------------------------

local plugins = {
    -- CMP
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },

    -- GIT
    { 'airblade/vim-gitgutter' },                       -- git column
    { 'numToStr/Comment.nvim', event = 'VeryLazy' },    -- easier commenting

    -- LAYOUT
    { 'nvim-tree/nvim-web-devicons', lazy = true },     -- icons
    { 'nvim-lualine/lualine.nvim' },                    -- statusbar
    { "EdenEast/nightfox.nvim" },                       -- color theme
    { 'folke/noice.nvim', event = 'VeryLazy',           -- message UI
       dependencies = { "MunifTanjim/nui.nvim" } 
    },

    -- LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' }, -- multiline errors

    -- NO CONFIG
    { 'mg979/vim-visual-multi' },                       -- multi cursors (ctrl+n)
 
    -- NAVIGATE
    { 'nvim-tree/nvim-tree.lua' },                      -- file tree
    { 'nvim-telescope/telescope.nvim', tag = '0.1.6',   -- telescope
       dependencies = { 'nvim-lua/plenary.nvim' } 
    },

    -- TMUX
    { 'karshPrime/only-tmux.nvim', event = 'VeryLazy' },-- tmux panels :only
    { 'christoomey/vim-tmux-navigator' },               -- vim tmux keybinds
}

local opts = {}

require("lazy").setup(plugins, opts)

-- load indie config files
require("plugins.cmp")
require("plugins.editor")
require("plugins.layout")
require("plugins.lsp")
require("plugins.navigate")
require("plugins.tmux")

