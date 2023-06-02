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
  end
})

-- TS config
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "scala", "json", "org" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = {'org'},
	},

	rainbow = {
		enable = true,
		disable = {},
		query = 'rainbow-parens',
		strategy = require 'ts-rainbow.strategy.local',
		hlgroups = {
			"TSRainbowCustomBlue",
			"TSRainbowCustomPurple",
			"TSRainbowCustomGreen",
			"TSRainbowCustomBlue",
			"TSRainbowCustomPurple",
			"TSRainbowCustomGreen",
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
