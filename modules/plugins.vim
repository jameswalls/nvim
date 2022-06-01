" plug
call plug#begin('~/.nvim/plugged')
	" telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim'
	Plug 'BurntSushi/ripgrep'
	
	" Intellisense 
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	
	" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'
	Plug 'romgrk/nvim-treesitter-context'
	
	" functionality
	Plug 'preservim/nerdcommenter'
	
	" python
	Plug 'vim-python/python-syntax'
	
	" layout
	Plug 'itchyny/lightline.vim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	
	" git
	Plug 'sindrets/diffview.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	
	" colorscheme
	Plug 'jjpp109309/onedark.nvim'
	Plug 'jjpp109309/vscode.nvim'
	Plug 'ellisonleao/gruvbox.nvim'
	
call plug#end()


