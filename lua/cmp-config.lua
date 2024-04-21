local cmp = require("cmp")
local cmp_kinds = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

-- Global setup.
cmp.setup({
	completion = {
		completeopt = "menu,menuone,noinsert"
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	view = {
		entries = { "custom" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert}),
	}),
	formatting = {
		fields = { "kind", "abbr" },
		format = function(_, vim_item)
			vim_item.kind = cmp_kinds[vim_item.kind] or " "
			vim_item.menu = ""
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path'},
	})
})
