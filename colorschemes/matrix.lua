-- Example config in Lua
vim.g.thematrix_backround_color = "dark"
vim.g.thematrix_function_style = "NONE"
vim.g.thematrix_keyword_style = "NONE"

-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
-- vim.g.thematrix_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}

-- Enable telescope theme
-- vim.g.thematrix_telescope_theme = 1

-- Enable transparent mode
-- vim.g.thematrix_transparent_mode = 0

-- Load the colorscheme
vim.cmd.colorscheme "thematrix"
