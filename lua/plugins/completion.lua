return {
  --------------------------------------------------------------------
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
      local cmp = require("cmp")

      cmp.setup {
        sources = {
          { name = "nvim_lsp" }
        }
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
    end
  },
  -------------------------------------------------------------------
  {
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require("cmp")

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" }
            }
          }
        })
      })
    end
  },
  -------------------------------------------------------------------
  {
    "hrsh7th/cmp-path",
    config = function()
      require("cmp").setup {
        sources = {
          { name = "path" }
        }
      }
    end
  },
  -------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        })
      }
    end
  }
}
