local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  -- Have Packer manage itself
  use 'wbthomason/packer.nvim'

  -- Cache me (lua) outside how bout dat
  use 'lewis6991/impatient.nvim'

  --[[
  Vimscript plugins
  Hopefully one day there will be lua alternatives to thise plugins, sorry tpope :(
  ]]
  use 'tpope/vim-sleuth'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'

  use 'tpope/vim-eunuch'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'

  use 'christoomey/vim-tmux-navigator'

  use 'janko-m/vim-test'

  --[[
  Lua Plugins Begin
  ]]

  -- colorscheme
  use 'EdenEast/nightfox.nvim'

  use 'numToStr/Comment.nvim' -- 'gc' to comment visual regions/lines
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  use 'folke/which-key.nvim'

  use 'norcalli/nvim-colorizer.lua'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline

  use 'akinsho/toggleterm.nvim'

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Add git related info in the signs columns and popups
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- LSP Config
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use({ 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } })
  -- Elixir specific
  use({
    'mhanberg/elixir.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    }
  })

  -- LSP UI
  use { 'tami5/lspsaga.nvim', config = function() require('config.lspsaga') end }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }


  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets
  use({
    'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets" -- Community snippets
    }
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
