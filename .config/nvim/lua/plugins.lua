local pack_use = function()
  local use = require("packer").use
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
  use 'kyazdani42/nvim-tree.lua'

  -- LSP configs --
  use "neovim/nvim-lspconfig"
  use "kabouzeid/nvim-lspinstall"
  use "folke/trouble.nvim"
  use "glepnir/lspsaga.nvim"

  -- Autocomplete --
  use "hrsh7th/nvim-compe"
  use 'ray-x/lsp_signature.nvim'

  -- Smart code highlighting (still in beta) --
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- Session management --
  use 'rmagatti/auto-session'

  -- Surround support --
  use 'blackCauldron7/surround.nvim'
end

local function load_plugins()
  require("packer").startup(
  {
    function()
      pack_use()
    end
  }
  )
end

local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  load_plugins()
  require("packer").sync()
else
  load_plugins()
end
