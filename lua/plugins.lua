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

		use 'HiPhish/nvim-ts-rainbow2'

		----------------------------------------------------------------------
		-- telescope
		----------------------------------------------------------------------

		-- fzf for fast search
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} }
		}
		----------------------------------------------------------------------
		-- lsp
		----------------------------------------------------------------------
		-- mason
		use {
			"williamboman/mason.nvim",
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig'
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
		use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
		use 'nvim-tree/nvim-web-devicons'
		use 'rafamadriz/friendly-snippets'

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
		-- Terminals
		----------------------------------------------------------------------
		use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		  require("toggleterm").setup()
		end}

		----------------------------------------------------------------------
		-- themes & layout
		----------------------------------------------------------------------
		-- lualine
		use {
		  'nvim-lualine/lualine.nvim',
		  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		}

		-- center pad
		-- packer.nvim
		use { 'smithbm2316/centerpad.nvim' }

		-- transparent vim
		use 'xiyaowong/nvim-transparent'

		-- autopairs
		use { "windwp/nvim-autopairs" }

		-- colorschemes
		use 'Mofiqul/vscode.nvim'
		use { "catppuccin/nvim", as = "catppuccin" }
		use({ 'rose-pine/neovim', as = 'rose-pine' })
		use 'nyoom-engineering/oxocarbon.nvim'

		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
	  	end
	end
)

