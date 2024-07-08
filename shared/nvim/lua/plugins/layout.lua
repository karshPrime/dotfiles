-------------------------------------------------------------------------------
--# Layout #-------------------------------------------------------------------

--# Color Theme #--------------------------------------------------------------

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


--# Statusline #---------------------------------------------------------------

require('lualine').setup({
    sections = {
        lualine_x = { {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff5f87" },
        } },
    },
})


--# noice #--------------------------------------------------------------------

require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },

    presets = {
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename. nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
    },

    cmdline = { format = {
        regex_down = {
            kind = "search", lang = "regex", title = " Regex Search ",
            pattern = "^/\\v", icon = " "
        },

        regex_up = {
            kind = "search", lang = "regex" , title = " Regex Search ",
            pattern = "^%?\\v", icon = " "
        },

        replace_all = {
            lang = "regex", title = " Replace All ",
            pattern = "^:%%s/", icon = "󰬲 "
        },

        replace_sel = {
            lang = "regex", title = " Replace Selected ",
            pattern = "^:'<,'>s/", icon = "󰬲 ",
        },
    } },
})

