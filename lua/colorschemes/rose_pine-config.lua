require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'main',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {},
	--
	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		['@function.builtin'] = { fg = 'Rose' },
		['@variable.builtin'] = { fg = 'Text'},
		['@parameter'] = { fg = 'Love' },
		['@include'] = { fg = 'Pine'},
		['@constant'] = { fg = 'Gold' },
		['@constant.builtin'] = { fg = 'Foam' },
		['@number'] = { fg = 'Foam'},
		['@float'] = { fg = 'Foam'},
		['@string'] = { fg = 'Foam' },
		['@boolean'] = { fg = 'Foam' },
		['@namespace'] = { fg = 'Gold'},
		['@constructor'] = { fg = 'Rose' },
		['@field'] = { fg = 'Rose' },
		['@method'] = { fg = 'Rose' },
		['@method.call'] = { fg = 'Rose' },
		['@attribute'] = { fg = 'Rose' },
		['@type.builtin'] = { fg = 'Iris' },
		['@type'] = { fg = 'Iris' },
		['@operator'] = { fg = 'Pine' },
		['@keyword.operator'] = { fg = 'Pine' },
		['@keyword.function'] = { fg = 'Pine' },
		['@repeat'] = { fg = 'Pine'},
		['@punctuation.special'] = { fg = 'Love'},
		['@spell'] = { fg = 'Subtle'}
	}
})

-- Set colorscheme after options
vim.cmd.colorscheme "rose-pine"
