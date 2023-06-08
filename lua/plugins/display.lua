local theme = "catppuccin-latte"

function setup()
  vim.cmd("colorscheme " .. theme)
end

return {
  {
    "catppuccin/nvim", 
    name = "catppuccin",
    lazy = false,
    config = setup,
  }
}
