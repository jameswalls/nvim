require("toggleterm").setup{
	open_mapping = [[<C-\>]],
	direction = "horizontal",
	hidden = false
}

-- keymaps
function _G.set_terminal_keymaps()
	local opts = {buffer = 0}
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	-- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	-- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal

function _PYTHON_TOGGLE()
	local file_name = vim.api.nvim_buf_get_name(0)
	local command = "%run " .. file_name
	local conda = Terminal:new({ cmd="ipython", directio="horizontal", hidden=false})
	conda:toggle()
	conda:send(command)
end

vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua  _PYTHON_TOGGLE()<CR>", {noremap = true, silent = true})
