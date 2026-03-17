-------------------------------------------------------------------------------
--# Editor #-------------------------------------------------------------------

vim.pack.add({
    'https://github.com/tpope/vim-obsession',         -- 
    'https://github.com/numToStr/Comment.nvim',	      -- easier commenting
    'https://github.com/kylechui/nvim-surround',	  -- more surround actions
    'https://github.com/karshPrime/ifdef.nvim',       --
    'https://github.com/lukas-reineke/indent-blankline.nvim'
})


--# Enable Plugins #-----------------------------------------------------------

require('Comment').setup()        -- Better Commenting
require("nvim-surround").setup()  -- Surround Actions


--# Preview ifdef conditions #-------------------------------------------------

require('ifdef').setup()

Map('<leader>h',  ':Ifdef current<CR>')
Map('<leader>u',  ':UndotreeToggle<CR>')


--# Indent Blankline #----------------------------------------------------------

local hooks = require("ibl.hooks")

-- Define your highlight groups
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IndentDark", { fg = "#2f4f4f" })
    vim.api.nvim_set_hl(0, "IndentStrong", { fg = "#ff5f87" })
end)

-- Setup indent-blankline
require("ibl").setup {
    indent = {
        highlight = {
            "IndentDark",
            "IndentDark",
            "IndentDark",
            "IndentDark",
            "IndentDark",
            "IndentDark",
            "IndentStrong",
        },
    },
    scope = {
        enabled = true,
        highlight = "IndentStrong",
    },
}

