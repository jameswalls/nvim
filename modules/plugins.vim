" plug
call plug#begin('~/.nvim/plugged')
	" telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'BurntSushi/ripgrep'
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'kyazdani42/nvim-web-devicons'

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'scalameta/nvim-metals'
	
	" autocomplete 
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'

	Plug 'preservim/nerdcommenter'

	" debug adapter protocol
	Plug 'mfussenegger/nvim-dap'

	" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'
	Plug 'romgrk/nvim-treesitter-context'
	Plug 'p00f/nvim-ts-rainbow'
	
	" layout
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'xiyaowong/nvim-transparent'
	Plug 'Vonr/align.nvim'
	
	" git
	Plug 'sindrets/diffview.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	
	" colorscheme
	Plug 'navarasu/onedark.nvim'
	Plug 'Mofiqul/vscode.nvim'
	Plug 'sainnhe/gruvbox-material'
	Plug 'arzg/vim-colors-xcode'
call plug#end()
