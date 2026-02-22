---------------------------------------------------------------------------------------------------
--# init.lua #-------------------------------------------------------------------------------------

local plugins = {
	-- CMP
	{ 'hrsh7th/cmp-nvim-lsp', event = 'VeryLazy' },
	{ 'hrsh7th/cmp-buffer', event = 'VeryLazy' },
	{ 'hrsh7th/cmp-path', event = 'VeryLazy' },
	{ 'hrsh7th/cmp-cmdline', event = 'VeryLazy' },
	{ 'hrsh7th/nvim-cmp', event = 'VeryLazy' },
    { 'hrsh7th/vim-vsnip', event = 'VeryLazy' },

	-- EDITOR
    { 'tpope/vim-obsession', event = 'VeryLazy' },
	{ 'airblade/vim-gitgutter', event = 'VeryLazy' },     -- git column
	{ 'numToStr/Comment.nvim', event = 'VeryLazy' },	  -- easier commenting
	{ 'kylechui/nvim-surround', event = 'VeryLazy' },	  -- more surround actions
	{ 'lukas-reineke/indent-blankline.nvim' },
    { 'mbbill/undotree', event = 'VeryLazy' },            -- Undo Tree
    { 'norcalli/nvim-colorizer.lua', event = 'VeryLazy' },-- preview hex colour
	{ 'folke/noice.nvim', event = 'VeryLazy',			  -- message UI
	   dependencies = { 'MunifTanjim/nui.nvim' }
	},

	-- LAYOUT
	{ 'nvim-lualine/lualine.nvim' }, -- statusbar
	{ 'karshPrime/tokyoburn.nvim' }, -- color theme
    { 'karshPrime/ifdef.nvim', event = 'VeryLazy' },

	-- LSP
	{ 'williamboman/mason.nvim', event = 'VeryLazy' },
	{ 'williamboman/mason-lspconfig.nvim', event = 'VeryLazy' },
	{ 'neovim/nvim-lspconfig', event = 'VeryLazy' },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', event = 'VeryLazy' },
	{ 'mfussenegger/nvim-jdtls', event = 'VeryLazy' },
	{ 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', event = 'VeryLazy' },

	-- NAVIGATE
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.8',   -- telescope
	   dependencies = { 'nvim-lua/plenary.nvim' },
	   event = 'VeryLazy'
	},

	-- TMUX
	{ 'christoomey/vim-tmux-navigator' },				-- vim tmux keybinds
	{ 'karshPrime/tmux-compile.nvim',					-- execute in tmux
	   event = 'VeryLazy'
	},
}

local opts = {}
require("lazy").setup(plugins, opts)

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            require("plugins.cmp")
            require("plugins.editor")
            require("plugins.lsp")
            require("plugins.navigate")
            require("plugins.tmux")
        end)
    end,
})
require("plugins.layout")

