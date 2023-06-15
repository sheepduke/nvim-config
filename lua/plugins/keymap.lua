local function setup()
  local wk = require("which-key")
  local gbm = require("ezbookmarks")
  local pbm = require("grapple")

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
      d = { ":Neotree<cr>", "Neo Tree" },
      o = { ":Oil<cr>", "Oil Buffer" }
    },
    f = {
      name = "Find",
      b = { ":Telescope buffers<cr>", "Buffer" },
      f = { ":Telescope find_files<cr>", "File" },
      g = { ":Telescope live_grep<cr>", "Grep" },
      m = { ":Telescope marks<cr>", "Marks" },
      M = { ":Telescope man_pages<cr>", "Man" },
      p = { ":Telescope git_files<cr>", "Git File" },
    },
    m = {
      name = "Mark",
      a = { function() gbm.AddBookmark() end, "Add Global Bookmark" },
      g = { function() gbm.OpenBookmark() end, "List Global Bookmark" },
      r = { function() gbm.RemoveBookmark() end, "Remove Global Bookmark" },
      m = { function() pbm.select { key = vim.fn.getcharstr() } end, "Jump to Project Bookmark" },
      M = { function() pbm.toggle { key = vim.fn.getcharstr() } end, "Set Named Project Bookmark" },
      l = { ":GrapplePopup tags<cr>", "List Project Bookmark" },
    },
    p = {
      name = "Project",
      b = { ":Telescope git_branches<cr>", "Branches" },
      c = { ":Telescope git_commits<cr>", "Commits" },
      f = { ":Telescope git_files<cr>", "Files" },
      s = { ":Telescope git_status<cr>", "Status" },
      p = { ":Telescope projects<cr>", "Projects" },
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
