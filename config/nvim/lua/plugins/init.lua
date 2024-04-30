----------------------------------------------------------------------------------------
--# init.lua #--------------------------------------------------------------------------

local plugins = {
    -- CMP
    'hrsh7th/cmp-nvim-lsp', 
    'hrsh7th/cmp-buffer', 
    'hrsh7th/cmp-path', 
    'hrsh7th/cmp-cmdline', 
    'hrsh7th/nvim-cmp', 

    -- EDITOR
    'numToStr/Comment.nvim',                            -- easier commenting
    'mg979/vim-visual-multi',                           -- multiple cursors (ctrl+n)
 
    -- GIT
    'airblade/vim-gitgutter',                           -- git column

    -- LAYOUT
    'nvim-tree/nvim-web-devicons',                      -- icons
    'nvim-lualine/lualine.nvim',                        -- statusbar
    'Shatur/neovim-ayu',                                -- color theme

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",     -- multiline errors

    -- TMUX
    'karshPrime/only-tmux.nvim',                        -- tmux panels :only
    'christoomey/vim-tmux-navigator',                   -- vim tmux keybinds

    -- NAVIGATE
    'nvim-tree/nvim-tree.lua',                          -- file tree
    {                                                   -- telescope
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
}

local opts = {}

require("lazy").setup(plugins, opts)

-- load indie config files
require("plugins.cmp")
require("plugins.git")
require("plugins.layout")
require("plugins.lsp")
require("plugins.navigate")
require("plugins.tmux")

