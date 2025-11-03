-------------------------------------------------------------------------------
--# CMP #----------------------------------------------------------------------

local cmp = require'cmp'

cmp.setup({
    snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) 
    end,
    },

    window = { },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({ select = true }),
    }),

    sources = cmp.config.sources(
        { { name = 'nvim_lsp' }, { name = 'vsnip' }, },
        { { name = 'buffer' }, }
    )
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
        { { name = 'git' }, }, { { name = 'buffer' }, }
    )
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' 
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        { { name = 'path' } }, { { name = 'cmdline' } }
    )
})

