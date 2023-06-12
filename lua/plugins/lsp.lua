return {
  --------------------------------------------------------------------
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end
  },
  --------------------------------------------------------------------
  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      local on_attach = function(client)
        require("lsp-format").on_attach(client)
      end

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup { on_attach = on_attach }
    end
  },
  --------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
    config = function()
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
  },
}
