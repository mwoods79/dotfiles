local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'rcarriga/nvim-notify',

  --[[
  Vimscript plugins
  Hopefully one day there will be lua alternatives to thise plugins, sorry tpope :(
  ]]
  'tpope/vim-sleuth',

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  'tpope/vim-eunuch',
  'tpope/vim-projectionist',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',

  'christoomey/vim-tmux-navigator',

  { 'janko-m/vim-test',
    dependencies = { 'jgdavey/tslime.vim' },
    config = function()
      vim.g["test#strategy"] = "tslime"
    end
  },

  --[[
  Lua Plugins Begin
  ]]

  -- colorscheme
  { 'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        options = {
          -- transparent = true,
          styles = {
            comments = "italic",
          },
        }
      })

      vim.cmd("colorscheme nightfox")
    end
  },

  { 'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- Automatic tags management
  'ludovicchabant/vim-gutentags',

  { 'folke/which-key.nvim',
    config = function()
      require('config.whichkey')
    end
  },

  'norcalli/nvim-colorizer.lua',

  { 'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup({})
    end
  },

  -- UI to select things (files, grep results, open buffers...)
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
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
  },

  -- Fancy statusline
  { 'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        extensions = {
          'nvim-tree',
          'quickfix',
          'fugitive',
          'toggleterm',
        }
      }
    end
  },

  -- Fancy tabs at top
  { "nanozuki/tabby.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", 'EdenEast/nightfox.nvim' },
    config = function()
      require("tabby").setup({})
    end
  },

  { 'akinsho/toggleterm.nvim',
    config = function()
      require('config.toggleterm')
    end
  },

  -- Add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.g.indent_blankline_char = '┊'
      vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
      vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end
  },

  -- Add git related info in the signs columns and popups
  { 'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        current_line_blame = false,
        yadm = {
          enable = true
        },
      }
    end
  },

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
      require('config.treesitter')
    end
  },

  -- LSP Config
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "neovim/nvim-lspconfig",
      dependencies = {
        "ray-x/lsp_signature.nvim",
      }
    },
  },

  { "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require('dap')
      require("dapui").setup()
    end
  },

  { 'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Elixir specific
  {
    'mhanberg/elixir.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    }
  },

  -- LSP UI
  { 'tami5/lspsaga.nvim',
    config = function()
      require('config.lspsaga')
    end
  },

  { "folke/trouble.nvim",
    config = function()
      require("trouble").setup { auto_open = false }
    end,
  },

  { "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  { "hrsh7th/nvim-cmp", -- Autocompletion plugin
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      'saadparwaiz1/cmp_luasnip',
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      require("config.cmp")
    end
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  },

  -- Snippets
  { 'L3MON4D3/LuaSnip',
    dependencies = {
      "rafamadriz/friendly-snippets" -- Community snippets
    }
  },

  { 'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require('hop').setup()
    end
  },

  { 'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    }
  },

  { 'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim'
  },
})
