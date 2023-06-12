return {
  {
    "L3MON4D3/LuaSnip"
  },
  --------------------------------------------------------------------
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Advertise capabilities to `clangd`.
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
    end
  },
  -------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        sources = {
          { name = "nvim_lsp" },
        }
      }
    end
  }
}
