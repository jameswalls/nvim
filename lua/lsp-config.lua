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
require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require('cmp')
local luasnip = require "luasnip"

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
	snippet = {
	  -- REQUIRED - you must specify a snippet engine
	  expand = function(args)
		  luasnip.lsp_expand(args.body)
	  end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Cr>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
		["C-n"] = cmp.mapping(
			function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end,
			{ "i", "s" }
		),
		["C-p"] = cmp.mapping(
			function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end,
			{ "i", "s" }
		),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[Lsp]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]"
			})[entry.source.name]

			return vim_item
		end
	},
	sources = {
	  { name = "nvim_lsp"},
	  { name = "luasnip"},
	  { name = "nvim_lua"},
	  { name = "buffer" },
	  { name = "path" }
	}
})

