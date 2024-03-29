local function setup()
  local wk = require("which-key")
  local gbm = require("ezbookmarks")
  local pbm = require("grapple")

  wk.register({
    b = {
      name = "Buffer",
      b = { ":Telescope buffers<cr>", "Buffer" },
      k = { ":Bdelete<cr>", "Kill Buffer" },
    },
    c = {
      name = "Common Tools",
      g = { ":Telescope live_grep<cr>", "Grep" },
      m = { ":Telescope man_pages<cr>", "Man" },
      s = { ":Spectre<cr>", "Spectre" },
      t = { ":terminal<cr>", "Terminal" },
    },
    d = {
      name = "Diagnostic",
      f = { function() vim.diagnostic.open_float() end, "Open Float" },
      j = { function() vim.diagnostic.goto_next() end, "Goto Next" },
      k = { function() vim.diagnostic.goto_prev() end, "Goto Previous" },
      h = { function() vim.diagnostic.hide() end, "Hide" },
      s = { function() vim.diagnostic.show() end, "Show" },
    },
    f = {
      name = "File",
      d = { ":Neotree<cr>", "Neo Tree" },
      o = { ":Oil<cr>", "Oil Buffer" },
      f = { ":Telescope find_files<cr>", "File" },
      p = { ":cd %:h<cr>", "Set Path" },
      s = { ":SudaWrite<cr>", "Write in Sudo" },
    },
    l = {
      name = "Lsp",
      a = { function() vim.lsp.buf.code_action() end, "Code Action" },
      f = { function() vim.lsp.buf.format() end, "Format" },
      h = { function() vim.lsp.buf.hover() end, "Hover" },
      r = { function() vim.lsp.buf.rename() end, "Rename" },
      R = { function() vim.lsp.buf.references() end, "References" },
    },
    m = {
      name = "Bookmark",
      a = { function() gbm.AddBookmark() end, "Add Global Bookmark" },
      l = { ":GrapplePopup tags<cr>", "List Project Bookmark" },
      m = { function() gbm.OpenBookmark() end, "List Global Bookmark" },
      M = { ":Telescope marks<cr>", "Marks" },
      r = { function() gbm.RemoveBookmark() end, "Remove Global Bookmark" },
    },
    p = {
      name = "Project",
      b = { ":Telescope git_branches<cr>", "Branches" },
      c = { ":Telescope git_commits<cr>", "Commits" },
      f = { ":Telescope git_files<cr>", "Files" },
      m = { function() pbm.select { key = vim.fn.getcharstr() } end, "Jump to Bookmarked File" },
      M = { function() pbm.toggle { key = vim.fn.getcharstr() } end, "Set Bookmarked File" },
      s = { ":Telescope git_status<cr>", "Status" },
      p = { ":Telescope workspaces<cr>", "Open" },
      l = { ":WorkspacesList<cr>", "List" },
    },
    s = {
      name = "Floaterm",
      h = { ":FloatermFirst<cr>", "First" },
      j = { ":FloatermNext<cr>", "Next" },
      k = { ":FloatermPrev<cr>", "Previous" },
      l = { ":FloatermLast<cr>", "Last" },
      n = { ":FloatermNew<cr>", "New" },
      s = { ":FloatermToggle<cr>", "Toggle" },
    },
    t = {
      name = "Tab",
      n = { ":tabnew<cr>", "New Tab" },
      c = { ":tabclose<cr>", "Close Tab" },
      l = { ":tabnext<cr>", "Next Tab" },
      h = { ":tabprevious<cr>", "Previous Tab" },
      o = { ":tabonly<cr>", "Close Others" },
    },
  }, { prefix = "<leader>" })

  wk.register({
    ["<C-s>"] = { ":w<cr>", "Save" },
    ["<C-q>"] = { ":qa<cr>", "Quit All" },
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
