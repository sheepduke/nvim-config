return {
  --------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = false -- Whether to use a global status bar.
        }
      })
    end
  },
  --------------------------------------------------------------------
  -- Display cursorline.
  {
    "RRethy/vim-illuminate"
  },
  --------------------------------------------------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        filetype_exclude = {
          "dashboard"
        }
      }
    end
  },
  --------------------------------------------------------------------
  -- Notification and cmd prompt overhaul.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  --------------------------------------------------------------------
  -- Welcome page.
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("dashboard").setup {
        theme = "hyper",
        config = {
          mru = {
            limit = 10
          }
        }
      }
    end
  }
}
