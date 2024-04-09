local harpoon = require("harpoon")
local nav_opts = { ui_nav_wrap = true}
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>n", function() harpoon:list():prev(nav_opts) end)
vim.keymap.set("n", "<leader>p", function() harpoon:list():next(nav_opts) end)

