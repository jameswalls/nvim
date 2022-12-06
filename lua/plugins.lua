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
		-- treesitter
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

		----------------------------------------------------------------------
		-- telescope
		----------------------------------------------------------------------
		use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

		-- fzf for fast search
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

		----------------------------------------------------------------------
		-- lsp
		----------------------------------------------------------------------
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} }
		}

		-- cmp for autocompletion
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/nvim-cmp'

		-- vsnip
		use 'hrsh7th/vim-vsnip'
		use 'hrsh7th/vim-vsnip-integ'


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
		-- lualine
		use {
		  'nvim-lualine/lualine.nvim',
		  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		}

		-- transparent vim
		use 'xiyaowong/nvim-transparent'

		-- colorschemes
		use 'Mofiqul/vscode.nvim'

		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
	  	end
	end
)

