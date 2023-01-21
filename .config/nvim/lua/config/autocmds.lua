-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--Support for Vlang
vim.cmd([[au BufNewFile,BufRead *.v set filetype=vlang]])
vim.cmd([[au BufNewFile,BufRead *.vv set filetype=vlang]])
vim.cmd([[au BufNewFile,BufRead *.vsh set filetype=vlang]])
