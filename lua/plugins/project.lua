return {
  --------------------------------------------------------------------
  -- Project/Worksapce management.
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("telescope").load_extension("workspaces")

      require("workspaces").setup({
        cd_type = "tab",
        hooks = {
          open = { "Neotree" },
        }
      })
    end
  },
  --------------------------------------------------------------------
  -- Project level file bookmark.
  {
    "cbochs/grapple.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_b = {
            {
              function()
                local key = require("grapple").key()
                return " [" .. key .. "]"
              end,
              cond = require("grapple").exists,
            }
          }
        }
      })
    end
  },
}
