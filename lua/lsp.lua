-- lsp
-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- lsp default keymappings
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {buffer=0})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
vim.keymap.set('n', '<space>df', vim.lsp.diagnostic.goto_next, {buffer=0})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})


-- python lsp configuration
require('lspconfig').jedi_language_server.setup{
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {buffer=0})
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
		vim.keymap.set('n', '<space>df', vim.lsp.diagnostic.goto_next, {buffer=0})
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
	end,
}


-- autocompletion
-- nvim-cmp setup
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  },
}
