local function setup()
  local wk = require("which-key")

  wk.register({
    b = {
      name = "Buffer",
      b = { "<cmd>:lua require('buffer_manager.ui').toggle_quick_menu()<cr>", "Buffer Menu" }
    },
    d = {
      name = "Directory",
      d = { "<cmd>NvimTreeOpen<cr>", "Nvim Tree" }
    },
  }, { prefix = "<leader>" })
end

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = setup,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
