-- scala: metals
vim.opt_global.shortmess:remove("F")

local metals_config = require("metals").bare_config()
--metals_config.init_options.statusBarProvider = "on"

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})

-- telescope integration
vim.keymap.set('n', '<leader>mc', '<cmd>Telescope metals commands<cr>')
