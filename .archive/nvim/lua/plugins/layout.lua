---------------------------------------------------------------------------------------------------
--# Layout #---------------------------------------------------------------------------------------

--# Color Theme #----------------------------------------------------------------------------------

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


--# Statusline #-----------------------------------------------------------------------------------

require('lualine').setup({
    sections = {
        lualine_x = { {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff5f87" },
        } },
    },
})


--# Indent Blankline #-----------------------------------------------------------------------------

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


--# noice #----------------------------------------------------------------------------------------

require("noice").setup({
    lsp = {
        progress = {
            enabled = false,          -- Disable LSP progress messages
        },
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

    routes = {{
        filter = {
            event = "lsp",
            kind = "progress",
            cond = function(message)
                local client = vim.tbl_get(message.opts, "progress", "client")
                return client == "jdtls"
            end,
        },
        opts = { skip = true },
    },},

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

