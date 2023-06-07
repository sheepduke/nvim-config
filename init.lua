local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local pluginDirectory = "lazy"

local pluginNames = {
  "display",
  "lsp",
  "which-key"
}

local plugins = {}

for _, name in pairs(pluginNames) do
  local pluginCollection = require(pluginDirectory .. "." .. name)

  for _, plugin in pairs(pluginCollection) do
    table.insert(plugins, plugin)
  end
end

require("lazy").setup(plugins)
