vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'navarasu/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
end)

