-- initial telescope
require('telescope').setup{
	defaults = {
		prompt_prefix = "> "
	}
}

-- additional extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>lg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>df', '<cmd>Telescope lsp_definitions<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>Telescope lsp_references<cr>')


-- filebrowser
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h <cr>", { noremap = true })
