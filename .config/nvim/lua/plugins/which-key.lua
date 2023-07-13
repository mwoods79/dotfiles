return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    prefix = "<leader>",
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({

      q = { ":q<cr>", "Quit" },
      Q = { ":wq<cr>", "Save & Quit" },
      w = { ":w<cr>", "Save" },
      x = { ":bdelete<cr>", "Close" },
      E = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
      e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      h = { "<cmd>nohlsearch<CR>", "No Highlight" },
      L = { "<cmd>Lazy<cr>", "Lazy" },

      f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        b = { "<cmd>Telescope buffers previewer=false<cr>", "Buffers" },
        s = { "<cmd>Telescope live_grep<cr>", "Grep" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
      },

      g = {
        name = "Git",
        g = { _LAZYGIT_TOGGLE, "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
      },

      l = {
        name = "LSP",
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
        f = { "<cmd>Format<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Install/Update LSP Servers" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        F = { "<cmd>ToggleFormatOnSave<cr>", "Toggle Format on Save" },
      },

      d = {
        name = "Debug",
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      },

      t = {
        name = "Test",
        f = { "<cmd>w | TestFile<cr>", "Test File" },
        t = { "<cmd>w | TestNearest<cr>", "Test Nearest" },
        a = { "<cmd>w | TestSuite<cr>", "Test Suite" },
        l = { "<cmd>w | TestLast<cr>", "Test Last" },
        v = { "<cmd>w | TestVisit<cr>", "Open last test file" },
      },

      T = {
        name = "Terminal",
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
      },

      p = {
        name = "ChatGPT",
        c = { "<cmd>ChatGPT<cr>", "Conversation Prompt" },
        e = { require("chatgpt").edit_with_instructions, "Edit with instructions" },
      },

      --   z = {
      --     name = "Focus",
      --     z = { ":ZenMode<cr>", "Toggle Zen Mode" },
      --     t = { ":Twilight<cr>", "Toggle Twilight" }
      --   },
    }, opts)
  end,
}
