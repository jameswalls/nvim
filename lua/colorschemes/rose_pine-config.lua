require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'dawn',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = true,
	disable_italics = true,

	-- --- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = '#ffffff',
	-- 	panel = 'surface',
	-- 	panel_nc = 'base',
	-- 	border = 'highlight_med',
	-- 	comment = 'muted',
	-- 	link = 'iris',
	-- 	punctuation = 'subtle',
	--
	-- 	error = 'love',
	-- 	hint = 'iris',
	-- 	info = 'foam',
	-- 	warn = 'gold',
	--
	-- 	headings = {
	-- 		h1 = 'iris',
	-- 		h2 = 'foam',
	-- 		h3 = 'rose',
	-- 		h4 = 'gold',
	-- 		h5 = 'pine',
	-- 		h6 = 'foam',
	-- 	}
	-- 	-- or set all headings at once
	-- 	-- headings = 'subtle'
	},
	--
	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
	-- 	-- ColorColumn = { bg = 'rose' },
	--
	-- 	-- Blend colours against the "base" background
	-- CursorLine = { bg = 'foam', blend = 10 },
	-- StatusLine = { fg = 'love', bg = 'love', blend = 10 },
		['@variable'] = { fg = '#000000' },
		['@field'] = { fg = '#f2558f' },
		['@function.builtin'] = { fg = '#000000' }
	}
})

-- Set colorscheme after options
vim.cmd.colorscheme "rose-pine"
