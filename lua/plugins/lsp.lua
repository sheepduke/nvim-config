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

      require("lsp-format").setup {}

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
    end
  },
}
