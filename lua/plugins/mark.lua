return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("telescope").load_extension("harpoon")

      local mark = require("harpoon.mark")

      require("lualine").setup({
        sections = {
          lualine_b = {
            {
              function()
                local key = mark.get_current_index()
                return " [" .. key .. "]"
              end,
              cond = function()
                return not (mark.get_current_index() == nil)
              end
            }
          }
        }
      })
    end
  }
}
