local function setup()
  local wk = require("which-key")
  local mark = require("harpoon.mark")
  local markUi = require("harpoon.ui")

  wk.register({
    ["1"] = { "1gt<cr>", "Tab 1" },
    ["2"] = { "2gt<cr>", "Tab 2" },
    ["3"] = { "3gt<cr>", "Tab 3" },
    ["4"] = { "4gt<cr>", "Tab 4" },
    ["5"] = { "5gt<cr>", "Tab 5" },
    ["6"] = { "6gt<cr>", "Tab 6" },
    ["7"] = { "7gt<cr>", "Tab 7" },
    ["8"] = { "8gt<cr>", "Tab 8" },
    ["9"] = { "9gt<cr>", "Tab 9" },
    b = {
      name = "Buffer",
      k = { ":bdelete<cr>", "Kill Buffer" },
      l = { function() require("buffer_manager.ui").toggle_quick_menu() end, "Buffer List" },
    },
    d = {
      name = "Directory",
      d = { ":NvimTreeOpen<cr>", "Nvim Tree" },
      o = { ":Oil<cr>", "Oil Buffer" }
    },
    f = {
      name = "Find",
      b = { ":Telescope buffers<cr>", "Buffer" },
      f = { ":Telescope find_files<cr>", "File" },
      g = { ":Telescope live_grep<cr>", "Grep" },
      m = { ":Telescope harpoon marks<cr>", "Marks" },
      M = { ":Telescope man_pages<cr>", "Man" },
      p = { ":Telescope git_files<cr>", "Git File" },
    },
    m = {
      name = "Mark",
      l = { function() markUi.toggle_quick_menu() end, "List" },
      m = { function() mark.add_file() end, "Mark" },
      t = { function() mark.toggle_file() end, "Toggle" },
      u = { function() mark.rm_file() end, "Unmark" },
    },
    p = {
      name = "Project",
      b = { ":Telescope git_branches<cr>", "Branches" },
      c = { ":Telescope git_commits<cr>", "Commits" },
      f = { ":Telescope git_files<cr>", "Files" },
      s = { ":Telescope git_status<cr>", "Status" },
    },
    t = {
      name = "Tab",
      n = { ":tabnew<cr>", "New Tab" },
      c = { ":tabclose<cr>", "Close Tab" },
      l = { ":tabnext<cr>", "Next Tab" },
      h = { ":tabprevious<cr>", "Previous Tab" },
    },
    w = {
      name = "Write",
      a = { ":wa<cr>", "Write All" },
      w = { ":wr<cr>", "Write File" },
      f = { ":w!<cr>", "Force Write" },
      s = { ":SudaWrite<cr>", "Write in Sudo" }
    }
  }, { prefix = "<leader>" })

  wk.register({
    ["<C-s>"] = { ":w<cr>", "Save" },
  })
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
