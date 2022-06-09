--language en_US

--split navigation
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')

--layout
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.showmatch = true
vim.opt.scrolloff = 2
vim.opt.wrap = false
vim.opt.colorcolumn = '80'

--insert mode remaps 
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '\'', '\'\'<Left>')
vim.keymap.set('i', '\"', '\"\"<Left>')

--editor
vim.opt.cursorline = true

--set termguicolors
vim.opt.background = 'dark'

-- scala: metals
vim.opt_global.shortmess:remove("F")
