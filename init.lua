vim.cmd('source $HOME/.config/nvim/modules/plugins.vim')
require('general')

vim.cmd('source $HOME/.config/nvim/modules/lsp.vim')
vim.cmd('source $HOME/.config/nvim/modules/treesitter.vim')
vim.cmd('source $HOME/.config/nvim/modules/telescope.vim')
vim.cmd('source $HOME/.config/nvim/modules/python.vim')
vim.cmd('source $HOME/.config/nvim/modules/gitsigns.vim')

require('colorschemes.gruvbox')

