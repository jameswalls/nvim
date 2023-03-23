-- autogroup for custom rainbow colors
local augroup = vim.api.nvim_create_augroup('CustomRainbowColors', {clear = true})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  desc = 'Add rainbow highlights',
  callback = function()
    vim.api.nvim_set_hl(0, 'TSRainbowCustomYellow', {fg = '#fcd546'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustomBlue', {fg = '#35a0f8'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustomPurple', {fg = '#d07ad1'})
  end
})

-- TS config
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	rainbow = {
		enable = true,
		disable = {},
		query = 'rainbow-parens',
		strategy = require 'ts-rainbow.strategy.local',
		hlgroups = {
			"TSRainbowCustomBlue",
			"TSRainbowCustomPurple",
			"TSRainbowCustomYellow",
		}
	}
}
