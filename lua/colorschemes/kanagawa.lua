-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = false,            -- enable undercurls
    commentStyle = { italic = false, bold = false },
    functionStyle = { bold = false },
    keywordStyle = { italic = false, bold = false},
    statementStyle = { bold = false },
    typeStyle = { bold = false },
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {
			Keyword = { fg = colors.theme.syn.keyword, bold = false },
			["@keyword.operator"] = { fg = colors.theme.syn.operator, bold = false },
			Boolean = { fg = colors.theme.syn.constant, bold = false },
			LineNr = { fg = colors.theme.ui.nontext, bg = colors.theme.ui.bg },
			SignColumn = { fg = colors.theme.ui.special, bg = colors.theme.ui.bg },
			GitSignsAdd = { fg = colors.theme.vcs.added, bg = colors.theme.ui.bg },
			GitSignsChange = { fg = colors.theme.vcs.changed, bg = colors.theme.ui.bg },
			GitSignsDelete = { fg = colors.theme.vcs.removed, bg = colors.theme.ui.bg },
		}
    end,
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
})

vim.cmd.colorscheme("kanagawa")
