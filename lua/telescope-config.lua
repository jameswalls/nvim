-- initial telescope
require('telescope').setup({
	defaults = {
		wrap_results = true,
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
})

-- additional extensions
require("telescope").load_extension("fzf")

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files theme=dropdown<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep theme=dropdown<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags theme=dropdown<cr>')
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope grep_string theme=dropdown<cr>')
vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions theme=dropdown<cr>')
vim.keymap.set('n', '<leader>td', '<cmd>Telescope lsp_type_definitions theme=dropdown<cr>')
vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references theme=dropdown<cr>')
vim.keymap.set('n', '<leader>gi', '<cmd>Telescope lsp_implementation theme=dropdown<cr>')
vim.keymap.set('n', '<leader>dg', '<cmd>Telescope diagnostics theme=dropdown<cr>')
vim.keymap.set('n', '<leader>cc', '<cmd>Telescope commands theme=dropdown<cr>')
vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers theme=dropdown<cr>')
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope current_buffer_fuzzy_find theme=dropdown<cr>')
vim.keymap.set('n', '<leader>cs', '<cmd>Telescope colorscheme theme=dropdown<cr>')
