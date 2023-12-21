vim.keymap.set("n", "<space>m", "<cmd>lua require(\"harpoon.mark\").add_file()<cr>")
vim.keymap.set("n", "<space>h", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")

vim.keymap.set("n", "<space>n", "<cmd>lua require(\"harpoon.ui\").nav_next()<cr>")
vim.keymap.set("n", "<space>p", "<cmd>lua require(\"harpoon.ui\").nav_prev()<cr>")

vim.keymap.set("n", "<space>q", "<cmd>lua require(\"harpoon.ui\").nav_file(1)<cr>")
vim.keymap.set("n", "<space>w", "<cmd>lua require(\"harpoon.ui\").nav_file(2)<cr>")
vim.keymap.set("n", "<space>e", "<cmd>lua require(\"harpoon.ui\").nav_file(3)<cr>")
vim.keymap.set("n", "<space>r", "<cmd>lua require(\"harpoon.ui\").nav_file(4)<cr>")
