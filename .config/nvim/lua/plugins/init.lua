return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      vim.notify = notify
    end,
  },

  --[[
  Vimscript plugins
  Hopefully one day there will be lua alternatives to thise plugins, sorry tpope :(
  ]]
  "tpope/vim-sleuth",

  "tpope/vim-eunuch",
  "tpope/vim-projectionist",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",

  "christoomey/vim-tmux-navigator",

  -- Automatic tags management
  "ludovicchabant/vim-gutentags",

  {
    "janko-m/vim-test",
    dependencies = { "jgdavey/tslime.vim" },
    config = function()
      vim.g["test#strategy"] = "tslime"
    end,
  },

  --[[
  Lua Plugins Begin
  ]]

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap")
      require("dapui").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({ auto_open = false })
    end,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },
}
