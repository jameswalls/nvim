-- lsp
-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- lsp default keymappings
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})


-- python lsp configuration
require'lspconfig'.jedi_language_server.setup{
	capabilities = capabilities,
	on_attach = function()
	end,
}

-- lua lsp configuration
require'lspconfig'.sumneko_lua.setup {
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

-------------------------------------------------------------------------------
-- autocompletion
-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
	snippet = {
	  -- REQUIRED - you must specify a snippet engine
	  expand = function(args)
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	  end,
	},
	window = {
	  -- completion = cmp.config.window.bordered(),
	  -- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-d>'] = cmp.mapping.scroll_docs(4),
	  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  -- { name = 'luasnip' }, -- For luasnip users.
	  -- { name = 'ultisnips' }, -- For ultisnips users.
	  -- { name = 'snippy' }, -- For snippy users.
	}, {
	  { name = 'buffer' },
	})
})

