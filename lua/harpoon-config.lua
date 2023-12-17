local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<space>m", function() harpoon:list():append() end)
vim.keymap.set("n", "<space>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<space>q", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<space>w", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<space>e", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<space>r", function() harpoon:list():select(4) end)
