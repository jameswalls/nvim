-- initial telescope
local builtin = require("Telescope.builtin")
local extensions = require("Telescope").extensions

require('telescope').setup({
	defaults = {
		wrap_results = false,
		path_display = { "truncate" },
	},
	pickers = {
		find_files = {
			theme = "dropdown"
		},
		colorscheme = {
			enable_preview = true
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
			previewer = false
		},
		lsp_references = {
			theme = "dropdown"
		},
		lsp_document_symbols = {
			theme = "dropdown"
		},
		diagnostics = {
			theme = "dropdown"
		},
		quickfix = {
			theme = "dropdown"
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		live_grep_args = {
			auto_quoting = true,
			theme = "dropdown",
			previewer = false
		}
	}
})

-- additional extensions
require("telescope").load_extension("fzf")

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>gs', builtin.grep_string)
vim.keymap.set('n', '<leader>dg', builtin.diagnostics)
vim.keymap.set('n', '<leader>cc', builtin.commands)
vim.keymap.set('n', '<leader>bb', builtin.buffers)
vim.keymap.set('n', '<leader>cs', builtin.colorscheme)
vim.keymap.set('n', '<leader>qf', builtin.quickfix)
vim.keymap.set('n', '<leader>ss', function() builtin.current_buffer_fuzzy_find({fuzzy=false, case_mode="respect_case"})end)
vim.keymap.set("n", "<leader>fg", extensions.live_grep_args.live_grep_args)
