-- Lua:
-- For dark theme (neovim's default)
--vim.o.background = 'dark'
-- For light theme
--vim.o.background = 'light'

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
	italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        --vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        --Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
		TSConstructor = { fg = c.vscBlueGreen, bg = 'NONE' },
		TSType = { fg = c.vscBlueGreen, bg = 'NONE' },
		TSFuncBuiltin = { fg = c.vscMediumBlue, bg = 'NONE' },
		TSKeywordOperator = { fg = c.vscPink, bg = 'NONE' },
		TSMethod = { fg = c.vscLightBlue, bg = 'NONE' },
		TSKeyword = { fg = c.vscPink, bg = 'NONE' },
		TSKeywordReturn = { fg = c.vscPink, bg = 'NONE' },
		TSPunctBracket = { fg = c.vscCodeYellow, bg = 'NONE' },
		TSParameter = {fg = c.vscMediumBlue, bg = 'NONE'},
		TSOperator = {fg = c.vscLightRed, bg = 'NONE'},
		TSFunctionCall = {fg = c.vscBlueGreen, bg = 'NONE'}
    }
})
