local pluginDirectory = "plugins"

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
