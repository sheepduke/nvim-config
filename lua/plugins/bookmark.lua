return {
  --------------------------------------------------------------------
  -- Project level bookmark.
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
  --------------------------------------------------------------------
  -- Global bookmark.
  {
    "lifer0se/ezbookmarks.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}
