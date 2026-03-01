local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  -- Color Scheme --
  use "arcticicestudio/nord-vim"
  use "rakr/vim-one"
  use 'navarasu/onedark.nvim'

  -- Lualine (Statusline) support --
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope for fuzzy finding --
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- which-key for helping to identify possible next keys --
  use "folke/which-key.nvim"

  -- nvim-comment to auto-comment in code --
  use "terrortylor/nvim-comment"

  -- tree navigator --
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- LSP configs --
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  -- use "folke/trouble.nvim"
  use "nvimdev/lspsaga.nvim"

  -- Autocomplete --
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'ray-x/lsp_signature.nvim'

  -- Smart code highlighting (still in beta) --
  use {"nvim-treesitter/nvim-treesitter", run = function() vim.cmd("TSUpdate") end}

  -- Session management --
  use 'rmagatti/auto-session'

  -- Surround support --
  use 'kylechui/nvim-surround'

  -- Editorconfig --
  use 'editorconfig/editorconfig-vim'

  -- Prettier config --
  use {'prettier/vim-prettier', run ='yarn install'}

  -- Fugitive / Git --
  use 'tpope/vim-fugitive'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
