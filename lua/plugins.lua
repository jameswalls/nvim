local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
  	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(
	function(use)
		-- use "~/plugins/stackmap.nvim/"

		use 'wbthomason/packer.nvim'

		----------------------------------------------------------------------
		-- comment
		----------------------------------------------------------------------
		use 'terrortylor/nvim-comment'

		----------------------------------------------------------------------
		-- treesitter
		----------------------------------------------------------------------
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
		        	end,
		    	}

		use { 'nvim-treesitter/playground' }

		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
			requires = "nvim-treesitter/nvim-treesitter",
		})

		use 'nvim-treesitter/nvim-treesitter-context'

		----------------------------------------------------------------------
		-- telescope
		----------------------------------------------------------------------

		-- fzf for fast search
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.5',
			requires = { {'nvim-lua/plenary.nvim'} }
		}
		use "nvim-telescope/telescope-live-grep-args.nvim"

		use {
			"ThePrimeagen/harpoon",
			requires = { { "nvim-lua/plenary.nvim" } }
		}
		use 'folke/todo-comments.nvim'
		----------------------------------------------------------------------
		-- lsp
		----------------------------------------------------------------------
		-- mason
		use {
			"williamboman/mason.nvim",
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			"WhoIsSethDaniel/mason-tool-installer.nvim"
		}

		-- cmp for autocompletion
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/nvim-cmp'
		use 'saadparwaiz1/cmp_luasnip'
		use 'hrsh7th/cmp-nvim-lua'

		-- luasnip
		use({"L3MON4D3/LuaSnip"})

		-- kind icons
		use "onsails/lspkind.nvim"

		----------------------------------------------------------------------
		-- nvim-tree
		----------------------------------------------------------------------
		use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons', -- optional
			}
		}


		----------------------------------------------------------------------
		-- git
		----------------------------------------------------------------------
		use { 'lewis6991/gitsigns.nvim' }

		----------------------------------------------------------------------
		-- metals
		----------------------------------------------------------------------
		use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

		----------------------------------------------------------------------
		-- themes & layout
		----------------------------------------------------------------------
		-- tmux navigation
		-- use 'christoomey/vim-tmux-navigator'

		-- lualine
		use {
		  'nvim-lualine/lualine.nvim',
		  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		}

		-- parenthesis
		-- use 'HiPhish/rainbow-delimiters.nvim'

		-- autopairs
		use { "windwp/nvim-autopairs" }

		-- colorschemes
		use { "catppuccin/nvim", as = "catppuccin" }
		use 'gbprod/nord.nvim'
		use({ 'rose-pine/neovim', as = 'rose-pine' })
		use 'Mofiqul/vscode.nvim'
		use 'luisiacc/the-matrix.nvim'
		use 'navarasu/onedark.nvim'
		use "folke/tokyonight.nvim"
		use "projekt0n/github-nvim-theme"
		use "lunacookies/vim-colors-xcode"
		use "cocopon/iceberg.vim"
		use "water-sucks/darkrose.nvim"
		use "ellisonleao/gruvbox.nvim"
		use "aktersnurra/no-clown-fiesta.nvim"
		use "rebelot/kanagawa.nvim"

		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
	  	end
	end
)

