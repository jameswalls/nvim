-- language en_US

-- split navigation
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')

-- format optionsj
vim.cmd([[au FileType * set fo-=c fo-=r fo-=o]])

-- layout
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s%l %@SignCb@%=%T%@NumCb@%r  %T"
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.showmatch = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.colorcolumn = ''
vim.opt.splitbelow = true
vim.opt.splitright = true

-- insert mode remaps 
vim.keymap.set('i', 'jk', '<Esc>')

-- editor
vim.opt.cursorline = true
vim.opt.guicursor = "a:block-Cursor"
vim.opt.cursorlineopt = "number"
vim.opt.hlsearch = false
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })


-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
-- vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
-- vim.g.netrw_banner = false
-- vim.g.netrw_hide = 1
-- vim.cmd([[
--     let g:netrw_list_hide = netrw_gitignore#Hide() .. '\(^\|\s\s\)\zs\.\S\+'
-- ]])
-- vim.keymap.set("n", "<leader>tt", ':Rexplore<Cr>')
-- vim.keymap.set("n", "<leader>cf", ':Explore<Cr>')

-- quickfix list
vim.keymap.set("n", "<leader>]", ":cnext <Cr>")
vim.keymap.set("n", "<leader>[", ":cprev <Cr>")

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
	vim.api.nvim_set_hl(0, 'NordAuroraRed', {fg = '#BF616A'})
	vim.api.nvim_set_hl(0, 'NordAuroraOrange', {fg = '#D08770'})
	vim.api.nvim_set_hl(0, 'NordAuroraYellow', {fg = '#EBCB8B'})
	vim.api.nvim_set_hl(0, 'NordAuroraGreen', {fg = '#A3BE8C'})
	vim.api.nvim_set_hl(0, 'NordAuroraPurple', {fg = '#B48EAD'})
	vim.api.nvim_set_hl(0, 'NordSnowStorm1', {fg = '#D8DEE9'})
	vim.api.nvim_set_hl(0, 'NordSnowStorm2', {fg = '#E5E9F0'})
	vim.api.nvim_set_hl(0, 'NordSnowStorm3', {fg = '#ECEFF4'})
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup,
  desc = 'Add rainbow highlights for rainbow-delimiters',
  callback = rainbow_colors
})

local ts_context_augroup = vim.api.nvim_create_augroup("TreeSitterContext", {clear = true})
local treesitter_context_colors = function()
	vim.api.nvim_set_hl(0, "TreesitterContext", { bg="#32363e" })
	vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg="#32363e" })
	vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg="#32363e" })
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = ts_context_augroup,
  desc = "Add highlights for treesitter context",
  callback = treesitter_context_colors
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});
