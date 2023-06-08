local o = vim.opt
local g = vim.g

-- Disable netrw.
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Set leading key.
g.mapleader = " "

o.expandtab = true -- Use spaces as tabs.
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

o.wildmode = "longest,full"

-- set termguicolors to enable highlight groups
o.termguicolors = true
