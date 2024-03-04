-- initial telescope
local builtin = require("Telescope.builtin")
local extensions = require("Telescope").extensions

require('telescope').setup({
	defaults = {
		wrap_results = true,
	},
	pickers = {
		colorscheme = {
			enable_preview = true
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
			previewer = false
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		live_grep_args = {
			auto_quoting = false,
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
vim.keymap.set('n', '<leader>ss', builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>fg", extensions.live_grep_args.live_grep_args)
