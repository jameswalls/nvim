require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'pylsp', 'jedi_language_server', 'rust_analyzer'},
	PATH = "prepend"
})

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
  -- Mappings.
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set("n", 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set("n", 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", 'H', vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set("n", 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set("n", '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set("n", '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, opts)
end

require("lspconfig").lua_ls.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			}
		}
	}
}

require("lspconfig").pylsp.setup {
	on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E501" },
				}
			}
		}
	}
}

require('lspconfig').rust_analyzer.setup{
	on_attach = on_attach
}
