return {
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
}
