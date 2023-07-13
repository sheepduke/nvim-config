local open_with_external_program = function(path)
  local fileTypeHandler = {
    -- Audio & Video.
    ["m4v"] = "mpv %s",
    ["mkv"] = "mpv %s",
    ["mp4"] = "mpv %s",
    -- Image.
    ["jpg"] = "feh -Z. %s",
    ["png"] = "feh -Z. %s",
    ["jpeg"] = "feh -Z. %s",
    -- Documents.
    ["odt"] = "libreoffice %s",
    ["ods"] = "libreoffice %s",
    ["odp"] = "libreoffice %s",
    ["odg"] = "libreoffice %s",
    ["doc"] = "libreoffice %s",
    ["docx"] = "libreoffice %s",
    ["xls"] = "libreoffice %s",
    ["xlsx"] = "libreoffice %s",
    ["ppt"] = "libreoffice %s",
    ["pptx"] = "libreoffice %s",
    ["pdf"] = "mupdf",
  }
  local fileType = string.match(path, "[^.]+$")
  local handler = fileTypeHandler[fileType]
  if handler == nil then
    vim.notify(
      string.format("Unable to find a registered program for file type '%s'", fileType),
      vim.log.levels.ERROR)
  else
    local command = string.format(handler, path)
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
              ["o"] = "openWithExternalProgram"
            },
          },
        },
        commands = {
          openWithExternalProgram = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()

            open_with_external_program(path)
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
