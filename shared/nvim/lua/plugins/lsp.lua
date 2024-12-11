-------------------------------------------------------------------------------
--# LSP #----------------------------------------------------------------------

--# Tree Sitter #--------------------------------------------------------------

require('nvim-treesitter').setup({
	ensure_installed = {
		"c", "cpp", "rust", "zig",      -- low level
		"java", "go",					-- app dev
		"lua", "python", "bash",		-- scripting
		"vhdl",							-- HDL
		"html", "css"					-- web
	},
	highlight = { enable = true },
	indent = { enable = true },
	folding = { enable = true, },
})


--# Language Support #---------------------------------------------------------

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
require('lspconfig')['clangd'].setup { capabilities = capabilities }
require('lspconfig')['gopls'].setup { capabilities = capabilities }
require('lspconfig')['jdtls'].setup { capabilities = capabilities }
require('lspconfig')['zls'].setup { capabilities = capabilities }

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require('lspconfig')

--# Rust LSP
lspconfig.rust_analyzer.setup {}

--# Go LSP
lspconfig.gopls.setup {}

--# C/C++ LSP
lspconfig.clangd.setup {
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
}

--# Java LSP
require'lspconfig'.jdtls.setup{
	cmd = { 'jdtls' },
	root_dir = function(fname)
		return require'lspconfig'.util.root_pattern('build.gradle', 'pom.xml')(fname) or
		require'lspconfig'.util.find_git_ancestor(fname) or
		vim.fn.getcwd()
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

