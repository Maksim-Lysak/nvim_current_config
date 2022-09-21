vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'navarasu/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
	use 'terrortylor/nvim-comment'
	use 'nvim-lua/plenary.nvim'
	use 'windwp/nvim-autopairs'
	use {'phaazon/hop.nvim', branch = 'v2'}
	use {'akinsho/bufferline.nvim', tag = 'v2.*'}
	use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
	use 'neovim/nvim-lspconfig'
	use 'folke/trouble.nvim'
	use 'hrsh7th/nvim-cmp'
	use	'L3MON4D3/LuaSnip'
	use	'saadparwaiz1/cmp_luasnip'
	use	'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-path'
	use	'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-nvim-lua'
	use	'williamboman/nvim-lsp-installer'
	use {'lewis6991/gitsigns.nvim', tag = 'release'}
	  use {
    'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
  }
end)

