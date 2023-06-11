local theme = "catppuccin-latte"

return {
  -- Theme.
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.cmd("colorscheme " .. theme)
    end
  }
}
