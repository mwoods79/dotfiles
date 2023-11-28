-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Support for Vlang
vim.cmd([[au BufNewFile,BufRead *.v set filetype=vlang]])
vim.cmd([[au BufNewFile,BufRead *.vv set filetype=vlang]])
vim.cmd([[au BufNewFile,BufRead *.vsh set filetype=vlang]])
