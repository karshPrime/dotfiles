-------------------------------------------------------------------------------
--# init.lua #-----------------------------------------------------------------

local plugins = {
    -- CMP
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },

    -- EDITOR
    { 'chrisgrieser/nvim-rip-substitute' },             -- search n replace regex
    { 'airblade/vim-gitgutter' },                       -- git column
    { 'numToStr/Comment.nvim', event = 'VeryLazy' },    -- easier commenting

    -- LAYOUT
    { 'nvim-lualine/lualine.nvim' },                    -- statusbar
    { 'karshPrime/tokyoburn.nvim' },                    -- color theme
    { 'folke/noice.nvim', event = 'VeryLazy',           -- message UI
       dependencies = { 'MunifTanjim/nui.nvim' }
    },

    -- LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' }, -- multiline errors

    -- NO CONFIG
    { 'nvim-tree/nvim-web-devicons', lazy = true },     -- icons
    { 'mg979/vim-visual-multi', event = 'VeryLazy' },   -- multi cursors (ctrl+n)

    -- NAVIGATE
    { 'nvim-tree/nvim-tree.lua' },                      -- file tree
    { 'ThePrimeagen/harpoon', event = 'VeryLazy',       -- project wise marks
       branch = "harpoon2"
    },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8',   -- telescope
       dependencies = { 'nvim-lua/plenary.nvim' },
       event = 'VeryLazy'
    },

    -- TMUX
    { 'christoomey/vim-tmux-navigator' },               -- vim tmux keybinds
    { 'karshPrime/only-tmux.nvim', event = 'VeryLazy' },-- tmux panels :only
    { 'karshPrime/tmux-compile.nvim',                   -- execute in tmux
       event = 'VeryLazy'
    },
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

