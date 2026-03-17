--------------------------------------------------------------------------------
--# LSP #----------------------------------------------------------------------

vim.pack.add({
    'https://github.com/williamboman/mason.nvim',
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
})


--# Completion #---------------------------------------------------------------

vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

-- Enable LSP-driven autocompletion on attach
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.completion', {}),

    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })
        end
    end,
})

-- Use CTRL-space to manually trigger LSP completion
vim.keymap.set('i', '<C-Space>', function()
    vim.lsp.completion.get()
end)


--# Global LSP Config #--------------------------------------------------------

vim.lsp.config('*', {
    root_markers = { '.git' },
})


-- C/C++ LSP (clangd)

vim.lsp.config('clangd', {
    cmd = { 'clangd', '--background-index' },
    filetypes = { 'c', 'cpp' },
    root_markers = { 'Makefile', '.git' },
})
vim.lsp.enable('clangd')


-- Python LSP (pylsp)

vim.lsp.config('pylsp', {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', '.git' },
})
vim.lsp.enable('pylsp')


require('mason').setup()


--# Multiline Errors #---------------------------------------------------------

require("lsp_lines").setup()
vim.diagnostic.config({ virtual_text = false, })  -- disable default lsp errors

-- toggle errors
vim.keymap.set(
    "", "<space><space>", require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
)


--# LSP Keybinds #-------------------------------------------------------------
-- Note: Neovim 0.12 provides many LSP keymaps by default:
--   grr = references, grn = rename, gra = code action, gri = implementation
--   grt = type definition, grx = codelens, K = hover, CTRL-S = signature help
--   gO  = document symbols

Map('<space>e', vim.diagnostic.open_float)
Map('[d', vim.diagnostic.goto_prev)
Map(']d', vim.diagnostic.goto_next)
Map('<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		Map('gD', vim.lsp.buf.declaration, opts)
		Map('gd', vim.lsp.buf.definition, opts)

		Map('gwa', vim.lsp.buf.add_workspace_folder, opts)
		Map('gwr', vim.lsp.buf.remove_workspace_folder, opts)

		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
	end,
})

