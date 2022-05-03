-- Treesitter configuration
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

treesitter.setup({
  ensure_installed = 'all',
  -- phpdoc is experimental and crashes on apple silicon
  ignore_install = { 'phpdoc' },
  highlight = { enable = true },
  indent = { enable = true },
})
