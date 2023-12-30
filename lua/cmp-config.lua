local cmp = require("cmp")

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


-- Global setup.
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, replace = false })
				else
					fallback()
				end
			end,
		}),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = "[Lsp]",
				luasnip = "[Luasnip]",
				buffer = "[Buffer]",
				path = "[Path]"
			})[entry.source.name]

			return vim_item
		end
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'buffer' },
	})
})
