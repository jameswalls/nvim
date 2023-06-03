require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'main',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {},
	--
	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		['@constant'] = { fg = 'Rose' },
		['@parameter'] = { fg = 'Love' },
		['@number'] = { fg = 'Text'},
		['@float'] = { fg = 'Text'}
	}
})

-- Set colorscheme after options
vim.cmd.colorscheme "rose-pine"
