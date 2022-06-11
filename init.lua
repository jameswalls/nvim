vim.cmd('source $HOME/.config/nvim/modules/plugins.vim')
require('general')
require('lsp')
require('treesitter')
require('colorschemes.gruvbox')
require('telescope_config')
require('metals_config')
require('gitsigns_config')

--vim.cmd('source $HOME/.config/nvim/modules/python.vim')