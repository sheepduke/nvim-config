return {
  --------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "lukas-reineke/lsp-format.nvim",
    },
    config = function()
      local on_attach = function(client)
        require("lsp-format").on_attach(client)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("neodev").setup()
      require("lsp-format").setup {}

      local lspconfig = require("lspconfig")

      -- F#
      lspconfig.fsautocomplete.setup {
        on_attach = on_attach,
        capabilities = capabilities
      }

      -- Lua
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Rust
      lspconfig.rust_analyzer.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  },
}
