--------------------------------------------------------------------------------
--# Layout #--------------------------------------------------------------------

--# Color Theme #---------------------------------------------------------------

require("tokyoburn").setup({
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
    terminal_colors = true,
    lualine_bold = true,
})
vim.cmd[[colorscheme tokyoburn-night]]


--# Statusline #----------------------------------------------------------------

require('lualine').setup({
    sections = {
        lualine_x = { {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff5f87" },
        } },
    },
})


--# Git Gutter #---------------------------------------------------------------

vim.g.gitgutter_enabled = 1       -- Enable GitGutter always
vim.o.signcolumn = 'yes'          -- Always show the sign column (gutter)


--# Preview ifdef conditions #-------------------------------------------------

require('ifdef').setup()

Map('<leader>h',  ':Ifdef current<CR>')
Map('<leader>u',  ':UndotreeToggle<CR>')

