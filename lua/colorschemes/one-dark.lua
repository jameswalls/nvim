-- Lua
require('onedark').setup  {
    -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = true, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
		["@boolean"] = { fg = "$yellow" },
		["@constant"] = { fg = "$yellow" },
		["@constant.builtin"] = { fg = "$yellow" },
		["@constructor"] = { fg = "$blue", fmt = "none" },
		["@function.macro"] = { fg = "$blue" },
		["@module"] = { fg = "$fg" },
		["@number"] = { fg = "$yellow" },
		["@operator"] = { fg = "$cyan" },
		["@preproc"] = { fg = "$fg" },
		["@punctuation.special"] = { fg = "$fg" },
		["@string.escape"] = { fg = "$yellow" },
		["@type"] = { fg = "$cyan" },
		["@type.builtin"] = { fg = "$cyan" },
		["@variable.builtin"] = { fg = "$fg" },
		["@variable.member"] = { fg = "$fg" },
		["@variable.parameter"] = { fg = "$fg" },
		["CursorLineNr"] = { fg = "$yellow" },
		["FloatBorder"] = { fg = "$yellow", bg = "$none" },
		["NormalFloat"] = { fg = "$yellow", bg = "$none" },
		["LspSignatureActiveParameter"] = { fg = "$purple"}
	}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

vim.cmd.colorscheme("onedark")
