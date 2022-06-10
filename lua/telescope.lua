-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>')
