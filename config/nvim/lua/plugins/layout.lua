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


--# noice #-----------------------------------------------------------------------------

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
