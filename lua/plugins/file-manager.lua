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

            local fileTypeHandler = {
              ["m4v"] = "mpv %s",
              ["mkv"] = "mpv %s",
              ["mp4"] = "mpv %s"
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
