local theme = "catppuccin-latte"

local function setupTheme()
  vim.cmd("colorscheme " .. theme)
end

return {
  -- Icons.
  "nvim-tree/nvim-web-devicons",

  {
    -- Theme.
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = setupTheme,
  }
}
