local function setup()
  local wk = require("which-key")
  local gbm = require("ezbookmarks")
  local pbm = require("grapple")

  wk.register({
    b = {
      name = "Buffer",
      k = { ":Bdelete<cr>", "Kill Buffer" },
    },
    c = {
      name = "Common Tools",
      s = { ":Spectre<cr>", "Spectre" },
      t = { ":terminal<cr>", "Terminal" },
    },
    d = {
      name = "Directory",
      d = { ":Neotree<cr>", "Neo Tree" },
      o = { ":Oil<cr>", "Oil Buffer" },
    },
    f = {
      name = "Find",
      b = { ":Telescope buffers<cr>", "Buffer" },
      f = { ":Telescope find_files<cr>", "File" },
      g = { ":Telescope live_grep<cr>", "Grep" },
      m = { ":Telescope marks<cr>", "Marks" },
      M = { ":Telescope man_pages<cr>", "Man" },
    },
    l = {
      name = "Lsp",
      a = { function() vim.lsp.buf.code_action() end, "Code Action" },
    },
    m = {
      name = "Mark",
      a = { function() gbm.AddBookmark() end, "Add Global Bookmark" },
      l = { function() gbm.OpenBookmark() end, "List Global Bookmark" },
      r = { function() gbm.RemoveBookmark() end, "Remove Global Bookmark" },
    },
    p = {
      name = "Project",
      b = { ":Telescope git_branches<cr>", "Branches" },
      c = { ":Telescope git_commits<cr>", "Commits" },
      f = { ":Telescope git_files<cr>", "Files" },
      s = { ":Telescope git_status<cr>", "Status" },
      p = { ":Telescope workspaces<cr>", "Open" },
      l = { ":WorkspacesList<cr>", "List" },
      m = { function() pbm.select { key = vim.fn.getcharstr() } end, "Jump to Project Bookmark" },
      M = { function() pbm.toggle { key = vim.fn.getcharstr() } end, "Set Named Project Bookmark" },
      g = { ":GrapplePopup tags<cr>", "List Project Bookmark" },
    },
    t = {
      name = "Tab",
      n = { ":tabnew<cr>", "New Tab" },
      c = { ":tabclose<cr>", "Close Tab" },
      l = { ":tabnext<cr>", "Next Tab" },
      h = { ":tabprevious<cr>", "Previous Tab" },
      o = { ":tabonly<cr>", "Close Others" },
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

  wk.register({
    ["<M-1>"] = { "1gt<cr>", "Tab 1" },
    ["<M-2>"] = { "2gt<cr>", "Tab 2" },
    ["<M-3>"] = { "3gt<cr>", "Tab 3" },
    ["<M-4>"] = { "4gt<cr>", "Tab 4" },
    ["<M-5>"] = { "5gt<cr>", "Tab 5" },
    ["<M-6>"] = { "6gt<cr>", "Tab 6" },
    ["<M-7>"] = { "7gt<cr>", "Tab 7" },
    ["<M-8>"] = { "8gt<cr>", "Tab 8" },
    ["<M-9>"] = { "9gt<cr>", "Tab 9" },
    ["<M-h>"] = { ":tabprevious<cr>", "Next Tab" },
    ["<M-l>"] = { ":tabnext<cr>", "Next Tab" },
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
