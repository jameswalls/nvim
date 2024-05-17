-- TS config
require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"query",
		"python",
		"scala",
		"json",
		"rust"
	},

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
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
	},

	-- textobjects = {
	-- 	select = {
	-- 		enable = true,
	-- 		lookahead = true,
	-- 		keymaps = {
	-- 			["af"] = "@function.outer",
	-- 			["if"] = "@function.inner",
	-- 			["ac"] = "@class.outer",
	-- 			["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
	-- 			["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
	-- 		},
	-- 		selection_modes = {
	-- 			['@parameter.outer'] = 'v', -- charwise
	-- 			['@function.outer'] = 'V', -- linewise
	-- 			['@class.outer'] = '<c-v>', -- blockwise
	-- 		},
	-- 		include_surrounding_whitespace = true,
	-- 	},
	-- 	swap = {},
	-- 	move = {
	-- 		enable = true,
	-- 		set_jumps = true, -- whether to set jumps in the jumplist
	-- 		goto_next_start = {
	-- 			["]m"] = "@function.outer",
	-- 			["]]"] = { query = "@class.outer", desc = "Next class start" },
	-- 		},
	-- 		goto_next_end = {
	-- 			["]M"] = "@function.outer",
	-- 			["]["] = "@class.outer",
	-- 		},
	-- 		goto_previous_start = {
	-- 			["[m"] = "@function.outer",
	-- 			["[["] = "@class.outer",
	-- 		},
	-- 		goto_previous_end = {
	-- 			["[M"] = "@function.outer",
	-- 			["[]"] = "@class.outer",
	-- 		},
	-- 	}
	--  	},
}
