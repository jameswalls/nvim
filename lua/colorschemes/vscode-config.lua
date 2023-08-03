-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme
--vim.o.background = 'light'

local c = require('vscode.colors').get_colors()

require('vscode').setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = false,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = false,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        --vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        --Variable = { fg=c.vscYellow, bg=c.vscLightGreen, bold=true },
		['@constructor'] = { fg=c.vscYellow },
		['@type.builtin'] = { fg=c.vscBlueGreen },
		['@function.builtin'] = { fg=c.vscBlueGreen },
		['@keyword.operator'] = { fg=c.vscPink },
		['@punctuation.special'] = { fg=c.vscDarkYellow },
		['@function.call'] = { fg='#DDDDDD' },
		['@method.call'] = { fg='#DDDDDD' },
		['@field'] = { fg='#DDDDDD' },
		['@none'] = { fg=c.vscBlue },
    }
})
require('vscode').load()
