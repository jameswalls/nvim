-- Default options:
require("kanagawa").setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = false,            -- enable undercurls
    commentStyle = { italic = false, bold = false },
    functionStyle = { bold = false },
    keywordStyle = { italic = false, bold = false},
    statementStyle = { bold = false },
    typeStyle = { bold = false },
    transparent = true,         -- do not set background color
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
			-- LineNr = { fg = colors.theme.ui.nontext, bg = colors.theme.ui.bg },
			LineNr = { fg = colors.theme.ui.nontext, bg = "None" },
			CursorLineNr = { fg = colors.theme.diag.warning, bg = "None", bold = true },
			SignColumn = { fg = colors.theme.ui.special, bg = "None" },
			GitSignsAdd = { fg = colors.theme.vcs.added, bg = "None" },
			GitSignsChange = { fg = colors.theme.vcs.changed, bg = "None" },
			GitSignsDelete = { fg = colors.theme.vcs.removed, bg = "None" },
			TelescopeBorder = { bg = "None"},
			ColorColumn = { bg = colors.theme.ui.bg_p1, blend = 50 }
		}
    end,
    background = {               -- map the value of "background" option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

vim.cmd.colorscheme("kanagawa")
