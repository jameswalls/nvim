vim.keymap.set('n', '<space>]', "<cmd>lua require('harpoon.ui').nav_next()<cr>")
vim.keymap.set('n', '<space>[', "<cmd>lua require('harpoon.ui').nav_prev()<cr>")
vim.keymap.set('n', '<space>h', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")
vim.keymap.set('n', '<space>m', "<cmd>lua require('harpoon.mark').add_file() <cr>")
