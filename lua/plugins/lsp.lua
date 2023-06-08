local function setupNeodev()
  require("neodev").setup({
  })
end

local function setupLspConfig()
  require("neodev")

  -- then setup your lsp server as usual
  local lspconfig = require('lspconfig')

  -- example to setup lua_ls and enable call snippets
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  })
end

return {
  -- Neovim dev.
  {
    "folke/neodev.nvim",
    config = setupNeodev
  },

  -- LSP config.
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
    config = setupLspConfig
  },
}
