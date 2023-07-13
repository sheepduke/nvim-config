local open_with = function(path)
  local program = vim.fn.input("Open with Program: ")
  local command = string.format("%s %s", program, path)
  vim.fn.jobstart(command)
end

local open_with_external_program = function(path)
  local fileTypeHandler = {
    -- Audio & Video.
    ["m4v"] = "mpv",
    ["mkv"] = "mpv",
    ["mp4"] = "mpv",
    -- Image.
    ["jpg"] = "feh -Z.",
    ["png"] = "feh -Z.",
    ["jpeg"] = "feh -Z.",
    -- Documents.
    ["odt"] = "libreoffice",
    ["ods"] = "libreoffice",
    ["odp"] = "libreoffice",
    ["odg"] = "libreoffice",
    ["doc"] = "libreoffice",
    ["docx"] = "libreoffice",
    ["xls"] = "libreoffice",
    ["xlsx"] = "libreoffice",
    ["ppt"] = "libreoffice",
    ["pptx"] = "libreoffice",
    ["pdf"] = "mupdf",
  }
  local fileType = string.match(path, "[^.]+$")
  local handler = fileTypeHandler[fileType]
  if handler == nil then
    vim.notify(
      string.format("Unable to find a registered program for file type '%s'", fileType),
      vim.log.levels.ERROR)
  else
    local command = string.format(handler + " %s", path)
    vim.fn.jobstart(command)
  end
end

return {
  --------------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      require("neo-tree").setup {
        filesystem = {
          window = {
            mappings = {
              ["o"] = "openWithExternalProgram",
              ["O"] = "openWith"
            },
          },
        },
        commands = {
          openWithExternalProgram = function(state)
            local path = state.tree:get_node():get_id()

            open_with_external_program(path)
          end,
          openWith = function(state)
            local path = state.tree:get_node():get_id()
            open_with(path)
          end
        }
      }
    end
  },
  --------------------------------------------------------------------
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        -- Do not restore window options to previous values when leaving an oil buffer.
        restore_win_options = false,
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = true,
        keymaps = {
          ["H"] = "actions.toggle_hidden",
          ["<bs>"] = "actions.parent"
        }
      }
    end
  }
}
