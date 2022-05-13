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

  -- Cache me outside how bout dat
  use 'lewis6991/impatient.nvim'

  use 'rcarriga/nvim-notify'

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

  use { 'janko-m/vim-test',
    requires = { 'jgdavey/tslime.vim' },
    config = function()
      vim.g["test#strategy"] = "tslime"
    end
  }

  --[[
  Lua Plugins Begin
  ]]

  -- colorscheme
  use { 'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        options = {
          -- transparent = true,
          styles = {
            comments = "italic",
          },
        }
      })
    end
  }

  use { 'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  use { 'folke/which-key.nvim',
    config = function()
      require('config.whichkey')
    end
  }

  use 'norcalli/nvim-colorizer.lua'

  use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup({})
    end
  }

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
      }
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require('telescope.actions').close,
            }
          },
        },
        extensions = {
          fzf = {
            override_generic_sorter = false, -- Causes crashes
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }

      -- Enable telescope fzf native
      telescope.load_extension('fzf')
      -- Replace vim ui select with telescope
      telescope.load_extension('ui-select')
    end
  }

  -- Fancy statusline
  use { 'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          -- theme = 'onedark',
        },
      }
    end
  }

  -- Fancy tabs at top
  use { "nanozuki/tabby.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("tabby").setup({})
    end
  }

  use { 'akinsho/toggleterm.nvim',
    config = function()
      require('config.toggleterm')
    end
  }

  -- Add indentation guides even on blank lines
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.g.indent_blankline_char = '┊'
      vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
      vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end
  }

  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        current_line_blame = false,
        yadm = {
          enable = true
        },
      }
    end
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
      require('config.treesitter')
    end
  }

  -- LSP Config
  use { 'neovim/nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
    },
  }

  use { 'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Elixir specific
  use({
    'mhanberg/elixir.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    }
  })

  -- LSP UI
  use { 'tami5/lspsaga.nvim',
    config = function()
      require('config.lspsaga')
    end
  }

  use { "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup { auto_open = false }
    end,
  }

  use { "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = function()
      require("todo-comments").setup {}
    end,
  }

  use { "hrsh7th/nvim-cmp", -- Autocompletion plugin
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      'saadparwaiz1/cmp_luasnip',
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      require("config.cmp")
    end
  }

  -- Snippets
  use { 'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets" -- Community snippets
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
