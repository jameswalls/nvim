-- autogroup for custom rainbow colors
local augroup = vim.api.nvim_create_augroup('CustomRainbowColors', {clear = true})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  desc = 'Add rainbow highlights',
  callback = function()
    vim.api.nvim_set_hl(0, 'TSRainbowCustom01', {fg = '#fcd546'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustom02', {fg = '#d07ad1'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustom03', {fg = '#35a0f8'})
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
			"TSRainbowCustom01",
			"TSRainbowCustom02",
			"TSRainbowCustom03",
		}
	}
}
