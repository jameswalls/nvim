-- initial telescope
require('telescope').setup{

	defaults = {
		prompt_prefix = "> ",
		wrap_results = true,
		path_display = {"absolute"},

		-- global ivy selection
		sorting_strategy = "ascending",

		layout_strategy = "bottom_pane",
		layout_config = {
			height = 25,
		},

		border = true,
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	},
}

-- additional extensions
require('telescope').load_extension('fzf')

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>')
vim.keymap.set('n', '<leader>td', '<cmd>Telescope lsp_type_definitions<cr>')
vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', '<leader>gi', '<cmd>Telescope lsp_implementation<cr>')
vim.keymap.set('n', '<leader>dg', '<cmd>Telescope diagnostics<cr>')


