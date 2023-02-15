return {
  "norcalli/nvim-colorizer.lua",

  -- colorscheme
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    config = function()
      require("nightfox").setup({
        options = {
          -- transparent = true,
          styles = {
            comments = "italic",
          },
        },
      })

      vim.cmd("colorscheme nightfox")
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- Fancy statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        extensions = {
          "nvim-tree",
          "quickfix",
          "fugitive",
          "toggleterm",
        },
      })
    end,
  },

  -- Fancy tabs at top
  {
    "nanozuki/tabby.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "EdenEast/nightfox.nvim" },
    config = function()
      require("tabby").setup({})
    end,
  },

  -- Add indentation guides even on blank lines
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      vim.g.indent_blankline_char = "┊"
      vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
      vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end,
  },
}
