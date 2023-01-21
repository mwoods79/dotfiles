-- Treesitter configuration
return { 'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = 'all',
      -- phpdoc is experimental and crashes on apple silicon
      ignore_install = { 'phpdoc' },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
