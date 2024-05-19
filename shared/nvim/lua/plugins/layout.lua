-------------------------------------------------------------------------------
--# Layout #-------------------------------------------------------------------

--# Color Theme #--------------------------------------------------------------

vim.o.background = 'dark'
local c = require('vscode.colors').get_colors()
require('vscode').setup({
    transparent = true,
    italic_comments = true,
    underline_links = true,
    disable_nvimtree_bg = true,
    color_overrides = {
        vscLineNumber = '#FF9E64',
    },
    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=false },
    }
})
vim.cmd.colorscheme "vscode"


--# Statusline #---------------------------------------------------------------

require('lualine').setup({
    options = {
        theme = 'vscode',
    },
    sections = {
        lualine_x = { {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#FF9E64" },
        } },
    },
})

-- border line colour
vim.cmd('highlight VertSplit guifg=#FF9E64 guibg=NONE ctermfg=160 ctermbg=NONE')


--# noice #--------------------------------------------------------------------

require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use
        -- **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },

    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,           -- use a classic bottom cmdline for search
        command_palette = true,         -- position the cmdline and popupmenu
                                        -- together
        long_message_to_split = true,   -- long messages will be sent to a split
        inc_rename = false,             -- enables an input dialog for inc-rename.
                                        -- nvim
        lsp_doc_border = false,         -- add a border to hover docs and 
                                        -- signature help
    },
})

