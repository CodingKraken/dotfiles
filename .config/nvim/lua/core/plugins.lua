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

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'Shatur/neovim-ayu'
	use 'nvim-lualine/lualine.nvim'
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
    	requires = {
      		"nvim-lua/plenary.nvim",
      		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      		"MunifTanjim/nui.nvim",
       		"3rd/image.nvim",
		}
  	}
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim' } }
	}
	use 'airblade/vim-gitgutter'
	use 'andweeb/presence.nvim'
	use 'rktjmp/lush.nvim'
	use 'rush-rs/tree-sitter-asm'
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig'
	}
	use 'mrjones2014/smart-splits.nvim'
	use 'catppuccin/nvim'
	use 'lervag/vimtex'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

