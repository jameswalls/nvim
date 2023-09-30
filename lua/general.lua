--language en_US

--split navigation
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')

-- format optionsj
vim.cmd([[au FileType * set fo-=c fo-=r fo-=o]])

--layout
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.showmatch = true
vim.opt.scrolloff = 4
vim.opt.wrap = true
vim.opt.colorcolumn = '80'

--insert mode remaps 
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'jl', '<Esc>la')
vim.keymap.set('i', 'j;', '<Esc><S-a>')

--editor
vim.opt.cursorline = false
vim.opt.guicursor = ''

--set termguicolors
vim.opt.background = 'dark'

-- nvim-tree
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- custom highlights
local augroup = vim.api.nvim_create_augroup('CustomRainbowColors', {clear = true})
local rainbow_colors = function()
	vim.api.nvim_set_hl(0, 'TSRainbowCustomYellow', {fg = '#fcd546'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustomBlue', {fg = '#35a0f8'})
    vim.api.nvim_set_hl(0, 'TSRainbowCustomPurple', {fg = '#d07ad1'})
	vim.api.nvim_set_hl(0, 'TSRainbowCustomGreen', {fg = '#559777'})
	vim.api.nvim_set_hl(0, 'TSRainbowCustomOrange', {fg = '#FFAC1C'})
	vim.api.nvim_set_hl(0, 'NordFrost1', {fg = '#8FBCBB'})
	vim.api.nvim_set_hl(0, 'NordFrost2', {fg = '#88C0D0'})
	vim.api.nvim_set_hl(0, 'NordFrost3', {fg = '#81A1C1'})
	vim.api.nvim_set_hl(0, 'NordFrost4', {fg = '#5E81AC'})
	vim.api.nvim_set_hl(0, 'NordAurora1', {fg = '#BF616A'})
	vim.api.nvim_set_hl(0, 'NordAurora2', {fg = '#D08770'})
	vim.api.nvim_set_hl(0, 'NordAurora3', {fg = '#EBCB8B'})
	vim.api.nvim_set_hl(0, 'NordAurora4', {fg = '#A3BE8C'})
	vim.api.nvim_set_hl(0, 'NordAurora5', {fg = '#B48EAD'})
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  desc = 'Add rainbow highlights for rainbow-delimiters',
  callback = rainbow_colors
})
