local o = vim.opt

-- Disable netrw.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

o.expandtab = true -- Use spaces as tabs.
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

o.wildmode = "longest,full"

-- set termguicolors to enable highlight groups
o.termguicolors = true
