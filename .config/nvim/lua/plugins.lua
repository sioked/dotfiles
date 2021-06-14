local pack_use = function()
  local use = require("packer").use
  use "wbthomason/packer.nvim"

  -- Color Scheme --
  use "arcticicestudio/nord-vim"
  use "rakr/vim-one"

  -- Lualine (Statusline) support --
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Telescope for fuzzy finding --
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use "folke/which-key.nvim"
  use "terrortylor/nvim-comment"
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
