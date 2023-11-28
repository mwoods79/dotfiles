return {

  -- UNIX things
  "tpope/vim-eunuch",

  -- Project management
  "tpope/vim-projectionist",

  -- Use same navigation keys for tmux and vim
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },
  },
  -- Automatic tags management
  "ludovicchabant/vim-gutentags",

  {
    "janko-m/vim-test",
    dependencies = { "jgdavey/tslime.vim" },
    config = function()
      vim.g["test#strategy"] = "tslime"
    end,
    keys = {
      { "\\t", "<cmd>TestNearest<cr>", desc = "Run Nearest test" },
      { "\\T", "<cmd>TestFile<cr>", desc = "Run File test" },
      { "\\a", "<cmd>TestSuite<cr>", desc = "Run Suite test" },
      { "\\l", "<cmd>TestLast<cr>", desc = "Run Last test" },
      { "\\g", "<cmd>TestVisit<cr>", desc = "Visit test file" },
    },
  },
}
