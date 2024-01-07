vim.keymap.set("n", "<leader>m", "<cmd>lua require(\"harpoon.mark\").add_file()<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")

vim.keymap.set("n", "<leader>n", "<cmd>lua require(\"harpoon.ui\").nav_next()<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>lua require(\"harpoon.ui\").nav_prev()<cr>")

vim.keymap.set("n", "<leader>1", "<cmd>lua require(\"harpoon.ui\").nav_file(1)<cr>")
vim.keymap.set("n", "<leader>2", "<cmd>lua require(\"harpoon.ui\").nav_file(2)<cr>")
vim.keymap.set("n", "<leader>3", "<cmd>lua require(\"harpoon.ui\").nav_file(3)<cr>")
vim.keymap.set("n", "<leader>4", "<cmd>lua require(\"harpoon.ui\").nav_file(4)<cr>")
