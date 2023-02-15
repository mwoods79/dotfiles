local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- copy to end of line
map("n", "Y", "y$", { silent = true })
-- copy to system clipboard
map("v", "gy", '"+y', { silent = true })
-- copy whole file to system clipboard
map("n", "gY", 'gg"+yG', { silent = true })
