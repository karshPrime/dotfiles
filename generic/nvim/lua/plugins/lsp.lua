-------------------------------------------------------------------------------
--# LSP #----------------------------------------------------------------------

--# Tree Sitter #--------------------------------------------------------------

require('nvim-treesitter').setup({
	ensure_installed = {
		"c", "cpp", "go", "lua", "python", "bash", "html", "css"
	},

	highlight = { enable = true },
	indent    = { enable = true },
	folding   = { enable = true },
})


--# Language Support #---------------------------------------------------------

local capabilities = require('cmp_nvim_lsp').default_capabilities()

--# Go LSP
vim.lsp.config('gopls', { capabilities = capabilities })
vim.lsp.enable('gopls')

--# Python LSP
vim.lsp.config('pylsp', { capabilities = capabilities })
vim.lsp.enable('pylsp')

--# C/C++ LSP
vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",
        "--compile-commands-dir=build",
        "--fallback-style=LLVM"
    },
    init_options = { clangdFileStatus = true },
    root_dir = require('lspconfig').util.root_pattern("CMakeLists.txt"),

    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = {
            "clangd",
            "--background-index",
            "--compile-commands-dir=" .. new_root_dir .. "/build",
            "--fallback-style=Google"
        }
    end,
})
vim.lsp.enable('clangd')

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

Map('<space>e', vim.diagnostic.open_float)
Map('[d', vim.diagnostic.goto_prev)
Map(']d', vim.diagnostic.goto_next)
Map('<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = { buffer = ev.buf }
		Map('gD', vim.lsp.buf.declaration, opts)
		Map('gd', vim.lsp.buf.definition, opts)
		Map('gtd',vim.lsp.buf.type_definition, opts)

		Map('gi', vim.lsp.buf.implementation, opts)
		Map('gr', vim.lsp.buf.references, opts)
		Map('gR', vim.lsp.buf.rename, opts)

		Map('K',  vim.lsp.buf.hover, opts)
		Map('gk',  vim.lsp.buf.signature_help, opts)
		Map('gwa', vim.lsp.buf.add_workspace_folder, opts)
		Map('gwr', vim.lsp.buf.remove_workspace_folder, opts)

		vim.keymap.set({ 'n', 'v' }, '<space>ca',
			vim.lsp.buf.code_action, opts
		)

		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
	end,
})

