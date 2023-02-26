-- lsp
-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- lsp default keymappings
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer=0})


-- python lsp configuration
require'lspconfig'.jedi_language_server.setup{
	capabilities = capabilities,
	on_attach = function()
	end,
}

-- lua lsp configuration
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

