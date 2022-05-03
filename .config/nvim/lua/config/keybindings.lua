--Remap space as leader key
local map = require("config.utils").map
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
-- map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
-- map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
-- map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
