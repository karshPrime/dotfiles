----------------------------------------------------------------------------------------
--# Layout #----------------------------------------------------------------------------

--# Color Theme #-----------------------------------------------------------------------

require('ayu').colorscheme()
require('ayu').setup({
    overrides = {
        Normal = { bg = "None" },
        ColorColumn = { bg = "#121212" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "#121212" },
        CursorColumn = { bg = "#121212" },
        WhichKeyFloat = { bg = "None" },
        VertSplit = { bg = "None" },
    },
})
vim.cmd.colorscheme("ayu-dark")


--# Statusline #------------------------------------------------------------------------

require('lualine').setup({
  options = {
    theme = 'ayu',
  },
})

-- border line colour
vim.cmd('highlight VertSplit guifg=#ff5f87 guibg=NONE ctermfg=160 ctermbg=NONE')

