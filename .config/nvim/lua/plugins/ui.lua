return {
  "norcalli/nvim-colorizer.lua",

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      -- vim.cmd("colorscheme catppuccin")
      vim.cmd.colorscheme("catppuccin")
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
        options = {
          theme = "catppuccin",
          component_separators = "|",
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        tabline = {
          lualine_a = { "buffers" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { { "tabs", mode = 2 } },
        },
        extensions = {
          "nvim-tree",
          "quickfix",
          "fugitive",
          "toggleterm",
          "trouble",
        },
      })
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
