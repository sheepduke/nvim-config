return {
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
            limit = 0
          }
        }
      }
    end
  },
  --------------------------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    dependencies = "nvim-tree/nvim-web-devicons"
  }
}
