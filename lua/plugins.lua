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
	use {'lewis6991/gitsigns.nvim', tag = 'release'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)

