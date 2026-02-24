---------------------------------------------------------------------------------------------------
--# init.lua #-------------------------------------------------------------------------------------

--# Load Plugins #---------------------------------------------------------------------------------

require("lazy").setup({
	-- CMP
	{ event = 'VeryLazy', 'hrsh7th/cmp-nvim-lsp'  },
	{ event = 'VeryLazy', 'hrsh7th/cmp-buffer'    },
	{ event = 'VeryLazy', 'hrsh7th/cmp-path'      },
	{ event = 'VeryLazy', 'hrsh7th/cmp-cmdline'   },
	{ event = 'VeryLazy', 'hrsh7th/nvim-cmp'      },
    { event = 'VeryLazy', 'hrsh7th/vim-vsnip'     },

	-- EDITOR
    { event = 'VeryLazy', 'tpope/vim-obsession'                 },
	{ event = 'VeryLazy', 'airblade/vim-gitgutter'              },  -- git column
	{ event = 'VeryLazy', 'numToStr/Comment.nvim'               },	-- easier commenting
	{ event = 'VeryLazy', 'kylechui/nvim-surround'              },	-- more surround actions
    { event = 'VeryLazy', 'mbbill/undotree'                     },  -- Undo Tree
    { event = 'VeryLazy', 'norcalli/nvim-colorizer.lua'         },  -- preview hex colour
	{ event = 'VeryLazy', 'lukas-reineke/indent-blankline.nvim' },
	{ event = 'VeryLazy', 'folke/noice.nvim', 			            -- message UI
	   dependencies = { 'MunifTanjim/nui.nvim'                  }},

	-- LAYOUT
	{ 'nvim-lualine/lualine.nvim' }, -- statusbar
	{ 'karshPrime/tokyoburn.nvim' }, -- color theme
    { event = 'VeryLazy', 'karshPrime/ifdef.nvim' },

	-- LSP
	{ event = 'VeryLazy', 'williamboman/mason.nvim'           },
	{ event = 'VeryLazy', 'williamboman/mason-lspconfig.nvim' },
	{ event = 'VeryLazy', 'neovim/nvim-lspconfig'             },
	{ event = 'VeryLazy', 'mfussenegger/nvim-jdtls'           },
	{ event = 'VeryLazy', 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'         },
	{ event = 'VeryLazy', 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	-- NAVIGATE
	{ event = 'VeryLazy', 'nvim-telescope/telescope.nvim',
	   dependencies = { 'nvim-lua/plenary.nvim'   }},

	-- TMUX
	{ event = 'VeryLazy', 'christoomey/vim-tmux-navigator' },  -- vim tmux keybinds
	{ event = 'VeryLazy', 'karshPrime/tmux-compile.nvim'   }   -- execute in tmux
}, {})


--# Import Plugins #-------------------------------------------------------------------------------

-- Before loading the editor
require("plugins.layout")

-- After Loading the editor
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

