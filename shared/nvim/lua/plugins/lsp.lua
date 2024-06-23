-------------------------------------------------------------------------------
--# LSP #----------------------------------------------------------------------

--# Language Support #---------------------------------------------------------

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
require('lspconfig')['clangd'].setup { capabilities = capabilities }
require('lspconfig')['gopls'].setup { capabilities = capabilities }

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").rust_analyzer.setup {}
require("lspconfig").gopls.setup {}
require('lspconfig').clangd.setup {
    cmd = {
        "clangd",
        "--background-index",
        "--compile-commands-dir=.",
        "--fallback-style=LLVM"
    },
    init_options = { clangdFileStatus = true, },
    root_dir = require('lspconfig').util.root_pattern( ".git"),

    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = {
            "clangd",
            "--background-index",
            "--compile-commands-dir=" .. new_root_dir,
            "--fallback-style=Google"
        }
    end,
}


--# Multiline Errors #---------------------------------------------------------

require("lsp_lines").setup()
vim.diagnostic.config({ virtual_text = false, })  -- disable default lsp errors

-- toggle errors
vim.keymap.set( 
    "", "<space><space>", require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
)


--# LSP Keybinds #-------------------------------------------------------------

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<space>k',  vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>D',  vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)

        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
    end, 
})

