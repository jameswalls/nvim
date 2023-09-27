-- autogroup for custom rainbow colors
local augroup = vim.api.nvim_create_augroup('CustomRainbowColors', {clear = true})

vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  desc = 'Add rainbow highlights',
  callback = function()
    vim.api.nvim_set_hl(0, 'TSRainbowCustomYellow', {fg = '#fcd546'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustomBlue', {fg = '#35a0f8'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustomPurple', {fg = '#d07ad1'})
	vim.api.nvim_set_hl(0, 'TSRainbowCustomGreen', {fg = '#559777'})
	vim.api.nvim_set_hl(0, 'TSRainbowCustomOrange', {fg = '#FFAC1C'})
	vim.api.nvim_set_hl(0, 'NordFrost1', {fg = '#8FBCBB'})
	vim.api.nvim_set_hl(0, 'NordFrost2', {fg = '#88C0D0'})
	vim.api.nvim_set_hl(0, 'NordFrost3', {fg = '#81A1C1'})
	vim.api.nvim_set_hl(0, 'NordFrost4', {fg = '#5E81AC'})
	vim.api.nvim_set_hl(0, 'NordAurora1', {fg = '#BF616A'})
	vim.api.nvim_set_hl(0, 'NordAurora2', {fg = '#D08770'})
	vim.api.nvim_set_hl(0, 'NordAurora3', {fg = '#EBCB8B'})
	vim.api.nvim_set_hl(0, 'NordAurora4', {fg = '#A3BE8C'})
	vim.api.nvim_set_hl(0, 'NordAurora5', {fg = '#B48EAD'})
  end
})

-- TS config
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "scala", "json" },

	sync_install = false,

	auto_install = true,

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
			-- vscode
			"TSRainbowCustomBlue",
			"TSRainbowCustomYellow",
			"TSRainbowCustomPurple",
			"TSRainbowCustomGreen",
			"TSRainbowCustomOrange",
			-- nord: Frost
			-- "NordFrost1",
			-- "NordFrost2",
			-- "NordFrost3",
			-- "NordFrost4",
			-- nord: aurora
			-- "NordAurora3",
			-- "NordAurora2",
			-- "NordAurora5",
			-- "NordAurora1",
			-- "NordAurora4",
		}
	},
	playground = {
	    enable = true,
	    disable = {},
	    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	    persist_queries = false, -- Whether the query persists across vim sessions
	    keybindings = {
	      toggle_query_editor = 'o',
	      toggle_hl_groups = 'i',
	      toggle_injected_languages = 't',
	      toggle_anonymous_nodes = 'a',
	      toggle_language_display = 'I',
	      focus_language = 'f',
	      unfocus_language = 'F',
	      update = 'R',
	      goto_node = '<cr>',
	      show_help = '?',
		},
	}
}
