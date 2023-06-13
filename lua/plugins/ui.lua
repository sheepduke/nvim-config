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
      }
    end
  }
}
