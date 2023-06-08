local heightRatio = 0.8
local widthRatio = 0.6

local function setupNvimTree()
  require("nvim-tree").setup({
    view = {
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * widthRatio
          local window_h = screen_h * heightRatio
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2)
                           - vim.opt.cmdheight:get()
          return {
            border = 'rounded',
            relative = 'editor',
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
          end,
      },
      width = function()
        return math.floor(vim.opt.columns:get() * widthRatio)
      end,
    },
    renderer = {
      icons = {
        show = {
          git = false
        }
      }
    },
  })
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = setupNvimTree,
    opts = {
      sort_by = "case_insensitive",
      view = {
        width = 30,
      }
    }
  }
}
