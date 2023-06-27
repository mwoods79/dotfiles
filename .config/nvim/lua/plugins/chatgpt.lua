# https://github.com/jackMort/ChatGPT.nvim#interactive-popup
-- When using ChatGPT and ChatGPTEditWithInstructions, the following keybindings are available:
--
-- <C-Enter> [Both] to submit.
-- <C-y> [Both] to copy/yank last answer.
-- <C-o> [Both] Toggle settings window.
-- <Tab> [Both] Cycle over windows.
-- <C-m> [Chat] Cycle over modes (center, stick to right).
-- <C-c> [Both] to close chat window.
-- <C-u> [Chat] scroll up chat window.
-- <C-d> [Chat] scroll down chat window.
-- <C-k> [Chat] to copy/yank code from last answer.
-- <C-n> [Chat] Start new session.
-- <C-d> [Chat] draft message (create message without submitting it to server)
-- <C-r> [Chat] switch role (switch between user and assistant role to define a workflow)
-- <C-s> [Both] Toggle system message window.
-- <C-i> [Edit Window] use response as input.
-- <C-d> [Edit Window] view the diff between left and right panes and use diff-mode commands
-- When the setting window is opened (with <C-o>), settings can be modified by pressing Enter on the related config. Settings are saved across sections
return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup()
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
