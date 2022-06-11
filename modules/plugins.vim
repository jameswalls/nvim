" plug
call plug#begin('~/.nvim/plugged')
	" telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim'
	Plug 'BurntSushi/ripgrep'
	Plug 'nvim-telescope/telescope-file-browser.nvim'

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'scalameta/nvim-metals'
	
	" autocomplete 
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'

	Plug 'preservim/nerdcommenter'
	
	" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'
	Plug 'romgrk/nvim-treesitter-context'
	
	" python
	Plug 'vim-python/python-syntax'
	
	" layout
	Plug 'itchyny/lightline.vim'
	
	" git
	Plug 'sindrets/diffview.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	
	" colorscheme
	Plug 'jjpp109309/onedark.nvim'
	Plug 'jjpp109309/vscode.nvim'
	Plug 'sainnhe/gruvbox-material'
call plug#end()

